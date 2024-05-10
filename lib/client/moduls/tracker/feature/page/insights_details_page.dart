import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/experts/widgets/expert_card.dart';
import 'package:oria_pro/client/moduls/tracker/feature/widget/period_selector.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/tracker_bloc.dart';
import '../enitity/chart_period.dart';
import '../enitity/tracked_symptom.dart';
import '../widget/logger_card.dart';
import '../widget/severity_chart.dart';
import 'comapre_with_symptom_page.dart';

class InsightsDetailsPage extends StatefulWidget {
  const InsightsDetailsPage({
    super.key,
    required this.symptom,
  });
  final TrackedSymptom symptom;

  @override
  State<InsightsDetailsPage> createState() => _InsightsDetailsPageState();
}

class _InsightsDetailsPageState extends State<InsightsDetailsPage> {
  DateTime endDate = DateTime.now();
  DateTime startDate = DateTime.now().add(const Duration(days: -7));
  ChartDataPeriod period = ChartDataPeriod.weekly;
  TrackedSymptom? otherSymptom;

  int get range => period == ChartDataPeriod.weekly ? 7 : 30;

  @override
  void initState() {
    BlocProvider.of<TrackerBloc>(context).add(
      GetSymptomInsights(
        symptomId: widget.symptom.id,
        startDate: DateFormat('yyyy-MM-dd').format(startDate),
        endDate: DateFormat('yyyy-MM-dd').format(endDate),
        compareWith: otherSymptom?.id,
      ),
    );
    super.initState();
  }

  void updateDate(DateTime selectedStartDate, DateTime selectedEndDate) {
    setState(() {
      endDate = selectedEndDate;
      startDate = selectedStartDate;
    });
    BlocProvider.of<TrackerBloc>(context).add(
      GetSymptomInsights(
        symptomId: widget.symptom.id,
        startDate: DateFormat('yyyy-MM-dd').format(startDate),
        endDate: DateFormat('yyyy-MM-dd').format(endDate),
        compareWith: otherSymptom?.id,
      ),
    );
  }

  void updatePeriod(ChartDataPeriod selectedPeriod) {
    DateTime ed = DateTime.now();
    DateTime sd = ed.add(
        Duration(days: selectedPeriod == ChartDataPeriod.weekly ? -7 : -30));
    setState(() {
      period = selectedPeriod;
    });
    updateDate(sd, ed);
  }

  Future<void> addOtherSymptom(BuildContext blocContext) async {
    BlocProvider.of<TrackerBloc>(context).add(
      GetSymptomInsights(
        symptomId: widget.symptom.id,
        startDate: DateFormat('yyyy-MM-dd').format(startDate),
        endDate: DateFormat('yyyy-MM-dd').format(endDate),
        compareWith: otherSymptom?.id,
      ),
    );
    final TrackedSymptom? selectedSymptom = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return BlocProvider.value(
            value: BlocProvider.of<TrackerBloc>(
              blocContext,
            ),
            child: CompareWithSymptom(
              currentSymptom: widget.symptom,
            ),
          );
        },
      ),
    );
    if (selectedSymptom != null && selectedSymptom != otherSymptom) {
      setState(() {
        otherSymptom = selectedSymptom;
      });
      // ignore: use_build_context_synchronously
      BlocProvider.of<TrackerBloc>(blocContext).add(
        GetSymptomInsights(
          symptomId: widget.symptom.id,
          startDate: DateFormat('yyyy-MM-dd').format(startDate),
          endDate: DateFormat('yyyy-MM-dd').format(endDate),
          compareWith: selectedSymptom.id,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return OriaScaffold(
      appBarData: AppBarData(
        firstButtonUrl: SvgAssets.backAsset,
        onFirstButtonPress: () => context.maybePop(),
        title:
            AppLocalizations.of(context)!.symptomHistory(widget.symptom.name),
      ),
      body: BlocBuilder<TrackerBloc, TrackerState>(
        builder: (blocContext, state) {
          return Expanded(
            child: ListView(
              children: [
                if (state is GetInsightsLoading) const OriaLoadingProgress(),
                const SizedBox(
                  height: 12,
                ),
                OriaCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.symptom.name,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const Spacer(),
                          Text(
                            "${DateFormat('dd.MM').format(startDate)} "
                            "-"
                            " ${DateFormat('dd.MM').format(endDate)}",
                            style: const TextStyle(
                              fontFamily: "Satoshi",
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              final sd = startDate.add(Duration(days: -range));
                              updateDate(sd, startDate);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: OriaColors.primaryColor,
                                  )),
                              height: 28,
                              width: 28,
                              child: const Icon(
                                Icons.arrow_back_ios_sharp,
                                size: 14,
                                color: OriaColors.primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              final ed = endDate.add(Duration(days: range));
                              updateDate(endDate, ed);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: OriaColors.primaryColor,
                                ),
                              ),
                              height: 28,
                              width: 28,
                              child: const Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 14,
                                color: OriaColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: OriaColors.grey,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          children: [
                            PeriodSelector(
                              period: ChartDataPeriod.weekly,
                              isSelected: period == ChartDataPeriod.weekly,
                              onPress: () {
                                if (period != ChartDataPeriod.weekly) {
                                  updatePeriod(ChartDataPeriod.weekly);
                                }
                              },
                            ),
                            const SizedBox(width: 8),
                            PeriodSelector(
                              period: ChartDataPeriod.monthly,
                              isSelected: period == ChartDataPeriod.monthly,
                              onPress: () {
                                if (period != ChartDataPeriod.monthly) {
                                  updatePeriod(ChartDataPeriod.monthly);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),
                      SeverityChart(
                        severityLogs: state is GetInsightsSuccess
                            ? state.insights?.logs ?? []
                            : [],
                        otherSeverityLogs: state is GetInsightsSuccess
                            ? state.insights?.otherLogs ?? []
                            : [],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        AppLocalizations.of(context)!.compareWith,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 12),
                      otherSymptom == null
                          ? LoggerCard(
                              title: AppLocalizations.of(context)!.addSymptom,
                              onPress: () async {
                                await addOtherSymptom(blocContext);
                              },
                            )
                          : GestureDetector(
                              onTap: () async {
                                await addOtherSymptom(blocContext);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(34),
                                  border: Border.all(
                                    color: OriaColors.primaryColor,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.network(
                                      otherSymptom!.icon,
                                      height: 28,
                                      width: 28,
                                      color: OriaColors.primaryColor,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      otherSymptom!.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  AppLocalizations.of(context)!.insights,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 12),
                Builder(
                  builder: (context) {
                    final insightsList = state.insights?.insights ?? [];
                    if (insightsList.isEmpty) {
                      return OriaCard(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              SvgAssets.insightIcon,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              AppLocalizations.of(context)!.youDontHaveInsights,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    color: const Color(0xFF888888),
                                  ),
                            )
                          ],
                        ),
                      );
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => OriaCard(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              SvgAssets.insightIcon,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                insightsList[index],
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemCount: insightsList.length,
                    );
                  },
                ),
                const SizedBox(height: 28),
                Builder(
                  builder: (context) {
                    final expertsList = state.insights?.experts ?? [];
                    if (expertsList.isNotEmpty) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .consultExpertForSymptom(widget.symptom.name),
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 235,
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => ExpertCard(
                                expert: expertsList[index],
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 10),
                              itemCount: expertsList.length,
                            ),
                          ),
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
