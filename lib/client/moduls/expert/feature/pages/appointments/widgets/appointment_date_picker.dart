import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/bloc/appointment_bloc.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';

class AppointmentDatePicker extends StatelessWidget {
  AppointmentDatePicker({
    super.key,
    required this.onDateSelect,
    required this.selectedDate,
  });

  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();

  final Function(DateTime) onDateSelect;
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentBloc, AppointmentState>(
      builder: (context, state) {
        return EasyInfiniteDateTimeLine(
          locale: Intl.systemLocale,
          activeColor: OriaColors.secondaryOrange,
          controller: _controller,
          firstDate: DateTime.now(),
          focusDate: selectedDate,
          lastDate: DateTime.now().add(const Duration(days: 356)),
          onDateChange: (selectedDate) => onDateSelect(selectedDate),
          showTimelineHeader: false,
          dayProps: EasyDayProps(
            height: 80,
            width: 56,
            inactiveDayStyle: DayStyle(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              dayNumStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontFamily: "Satoshi",
                    color: OriaColors.green,
                  ),
              monthStrStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontFamily: "Satoshi",
                    color: OriaColors.grey,
                  ),
              dayStrStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontFamily: "Satoshi",
                    color: OriaColors.grey,
                  ),
            ),
          ),
        );
      },
    );
  }
}
