import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/entity/day_availability.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/extensions/date_extensions.dart';

import '../bloc/appointment_bloc.dart';

class HourCard extends StatelessWidget {
  const HourCard({
    super.key,
    required this.date,
    required this.suffix,
  });
  final DayAvailability date;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentBloc, AppointmentState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => BlocProvider.of<AppointmentBloc>(context)
              .add(SelectDate(date: date)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(
                color: !date.available
                    ? const Color(0xFFCFCFCF)
                    : date == state.selectedDate
                        ? const Color(0xFF53C66C)
                        : OriaColors.primaryColor,
              ),
              color: !date.available
                  ? Colors.transparent
                  : date == state.selectedDate
                      ? const Color(0xFFE6FAE1)
                      : const Color(0xFFFAF1E1),
            ),
            child: Center(
              child: Text(
                "${date.date.toHour()!} $suffix",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: !date.available
                          ? OriaColors.disabledColor
                          : date == state.selectedDate
                              ? const Color(0xFF53C66C)
                              : OriaColors.primaryColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Satoshi",
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
