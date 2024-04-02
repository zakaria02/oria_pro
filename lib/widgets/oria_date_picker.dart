import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';

class OriaDatePicker extends StatefulWidget {
  const OriaDatePicker({
    super.key,
    this.firstDate,
    required this.onSelectDate,
    required this.currentValue,
  });

  final DateTime? firstDate;
  final Function(DateTime? selectedDate) onSelectDate;
  final DateTime currentValue;

  @override
  State<StatefulWidget> createState() => _OriaDatePickerState();
}

class _OriaDatePickerState extends State<OriaDatePicker> {
  config(context) => CalendarDatePicker2WithActionButtonsConfig(
        firstDate: widget.firstDate ?? DateTime.now(),
        currentDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1),
        lastMonthIcon: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: OriaColors.iconButtonBackgound,
            shape: BoxShape.circle,
          ),
          child: const Padding(
            padding: EdgeInsets.only(left: 6.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: OriaColors.primaryColor,
              size: 18,
            ),
          ),
        ),
        nextMonthIcon: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: OriaColors.iconButtonBackgound,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_forward_ios,
            color: OriaColors.primaryColor,
            size: 18,
          ),
        ),
        dayTextStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontFamily: "Satoshi", fontWeight: FontWeight.w500),
        calendarType: CalendarDatePicker2Type.single,
        selectedDayHighlightColor: OriaColors.primaryColor,
        closeDialogOnCancelTapped: true,
        firstDayOfWeek: 1,
        weekdayLabelTextStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: OriaColors.disabledColor,
            ),
        weekdayLabels: [
          AppLocalizations.of(context)!.sun,
          AppLocalizations.of(context)!.mon,
          AppLocalizations.of(context)!.tue,
          AppLocalizations.of(context)!.wed,
          AppLocalizations.of(context)!.thu,
          AppLocalizations.of(context)!.fri,
          AppLocalizations.of(context)!.sat,
        ],
        controlsTextStyle: Theme.of(context).textTheme.displayLarge,
        centerAlignModePicker: true,
        customModePickerIcon: const SizedBox(),
        selectedDayTextStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      );

  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];

  @override
  void initState() {
    super.initState();
    _singleDatePickerValueWithDefaultValue = [widget.currentValue];
  }

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker2(
      config: config(context),
      value: _singleDatePickerValueWithDefaultValue,
      onValueChanged: (dates) {
        setState(() => _singleDatePickerValueWithDefaultValue = dates);
        widget.onSelectDate(dates.first);
      },
    );
  }
}
