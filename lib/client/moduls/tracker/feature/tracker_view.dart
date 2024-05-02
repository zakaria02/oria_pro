import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/tracker/feature/widget/tracked_symptom.dart';
import 'package:oria_pro/common/widgets/bar_date_picker.dart';
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
        builder: (context, state) {
          return OriaScaffold(
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
            body: state is TrackedDataLoading
                ? const OriaLoadingProgress()
                : Column(
                    children: [
                      BarDatePicker(
                        onDateSelect: (date) {},
                        selectedDate: selectedDate,
                        controller: _controller,
                      ),
                      const SizedBox(height: 38),
                      ListView(
                        shrinkWrap: true,
                        children: state.symptoms
                            .map((symptom) =>
                                TrackedSymptomCard(symptom: symptom))
                            .toList(),
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }
}
