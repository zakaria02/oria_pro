import 'package:auto_route/auto_route.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/tracker/feature/page/log_activity_page.dart';
import 'package:oria_pro/client/moduls/tracker/feature/page/log_severity_page.dart';
import 'package:oria_pro/client/moduls/tracker/feature/widget/tracked_symptom.dart';
import 'package:oria_pro/common/widgets/bar_date_picker.dart';
import 'package:oria_pro/utils/router/router.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../utils/constants/svg_assets.dart';
import '../../../../widgets/oria_app_bar.dart';
import '../../../../widgets/oria_date_picker.dart';
import '../../../../widgets/oria_dialog.dart';
import '../../../../widgets/oria_rounded_button.dart';
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
      create: (context) => TrackerBloc()..add(FetchSymptomsData()),
      child: BlocBuilder<TrackerBloc, TrackerState>(
        builder: (blocContext, state) {
          return OriaScaffold(
            bottomBarPadding: EdgeInsets.zero,
            appBarData: AppBarData(
              title: AppLocalizations.of(context)!.symptomTracekr,
              lastButtonUrl: SvgAssets.calendarIcon,
              onLastButtonPress: () async {
                final date = await showDialog(
                  context: context,
                  builder: (context) {
                    DateTime? pickedDate;
                    return OriaDialog(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: OriaDatePicker(
                              onSelectDate: (date) {
                                pickedDate = date;
                              },
                              currentValue: selectedDate,
                            ),
                          ),
                          const SizedBox(height: 16),
                          OriaRoundedButton(
                            onPress: () =>
                                Navigator.of(context).pop(pickedDate),
                            text: AppLocalizations.of(context)!.apply,
                          )
                        ],
                      ),
                    );
                  },
                );
                if (date != null) {
                  _controller.animateToDate(date);
                  setState(() {
                    selectedDate = date;
                  });
                }
              },
            ),
            padding: EdgeInsets.zero,
            body: Expanded(
              child: Stack(
                children: [
                  Column(
                    children: [
                      BarDatePicker(
                        onDateSelect: (date) {
                          setState(() {
                            selectedDate = date;
                          });
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
                            ...state.symptoms
                                .map(
                                  (symptom) => TrackedSymptomCard(
                                      symptom: symptom,
                                      logSymptom: (symptom) => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return BlocProvider.value(
                                                  value: BlocProvider.of<
                                                      TrackerBloc>(
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
                                        BlocProvider.of<TrackerBloc>(
                                                blocContext)
                                            .add(FetchActivities());
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return BlocProvider.value(
                                                value: BlocProvider.of<
                                                    TrackerBloc>(
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
                                      }),
                                )
                                .toList(),
                            const SizedBox(height: 60)
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (state is! TrackedDataLoading)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: OriaRoundedButton(
                        onPress: () => context.pushRoute(
                          EditMySymptomsRoute(
                              refresh: () =>
                                  BlocProvider.of<TrackerBloc>(blocContext)
                                      .add(FetchSymptomsData())),
                        ),
                        text: AppLocalizations.of(context)!.editMySymptoms,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
