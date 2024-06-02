import 'package:auto_route/auto_route.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/client/moduls/tracker/feature/page/insights_details_page.dart';
import 'package:oria_pro/client/moduls/tracker/feature/page/log_activity_page.dart';
import 'package:oria_pro/client/moduls/tracker/feature/page/log_severity_page.dart';
import 'package:oria_pro/client/moduls/tracker/feature/widget/tracked_symptom.dart';
import 'package:oria_pro/common/widgets/bar_date_picker.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/router/router.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';

import '../../../../utils/constants/svg_assets.dart';
import 'bloc/tracker_bloc.dart';

class TrackerView extends StatefulWidget {
  const TrackerView({super.key});

  @override
  State<TrackerView> createState() => _TrackerViewState();
}

class _TrackerViewState extends State<TrackerView> {
  DateTime selectedDate = DateTime.now();
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrackerBloc()
        ..add(SelectDate(selectedDate))
        ..add(FetchSymptomsData()),
      child: BlocBuilder<TrackerBloc, TrackerState>(
        builder: (blocContext, state) {
          return Stack(
            children: [
              Column(
                children: [
                  BarDatePicker(
                    firstDate: DateTime.now().add(const Duration(days: -30)),
                    lastDate: DateTime.now(),
                    onDateSelect: (date) {
                      setState(() {
                        selectedDate = date;
                      });
                      BlocProvider.of<TrackerBloc>(blocContext)
                          .add(SelectDate(selectedDate));
                      BlocProvider.of<TrackerBloc>(blocContext)
                          .add(FetchSymptomsData());
                    },
                    selectedDate: selectedDate,
                    controller: _controller,
                  ),
                  const SizedBox(height: 24),
                  state is TrackedDataLoading
                      ? const Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: OriaLoadingProgress(),
                        )
                      : const SizedBox(),
                  Expanded(
                    child: ListView(
                      children: [
                        ...state.symptoms.map(
                          (symptom) => TrackedSymptomCard(
                            symptom: symptom,
                            logSymptom: (symptom) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return BlocProvider.value(
                                    value: BlocProvider.of<TrackerBloc>(
                                      blocContext,
                                    ),
                                    child: LogSeverityPage(
                                      symptom: symptom,
                                    ),
                                  );
                                },
                              ),
                            ),
                            logActivity: (logEventId, activities) {
                              BlocProvider.of<TrackerBloc>(blocContext)
                                  .add(FetchActivities());
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return BlocProvider.value(
                                      value: BlocProvider.of<TrackerBloc>(
                                        blocContext,
                                      ),
                                      child: LogActivityPage(
                                        logEventId: logEventId,
                                        activities: activities,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                            viewInsights: (symptom) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return BlocProvider.value(
                                      value: BlocProvider.of<TrackerBloc>(
                                        blocContext,
                                      ),
                                      child: InsightsDetailsPage(
                                        symptom: symptom,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 60)
                      ],
                    ),
                  ),
                ],
              ),
              if (state is! TrackedDataLoading)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: OriaColors.green,
                      shape: BoxShape.circle,
                    ),
                    height: 56,
                    width: 56,
                    child: GestureDetector(
                      onTap: () {
                        context.pushRoute(
                          EditMySymptomsRoute(
                            refresh: () =>
                                BlocProvider.of<TrackerBloc>(blocContext).add(
                              FetchSymptomsData(),
                            ),
                            refreshTodaysAction: () {},
                          ),
                        );
                      },
                      child: Center(
                        child: SvgPicture.asset(
                          SvgAssets.styloIcon,
                          height: 23,
                          width: 23,
                        ),
                      ),
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
