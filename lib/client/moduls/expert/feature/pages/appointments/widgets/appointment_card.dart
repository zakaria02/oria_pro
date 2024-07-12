import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/entity/appointment_details.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/pages/upcoming_details_page.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/extensions/date_extensions.dart';
import 'package:oria_pro/utils/extensions/string_extensions.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:oria_pro/widgets/oria_rounded_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/appointment_bloc.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key, required this.appointment});
  final AppointmentDetails appointment;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentBloc, AppointmentState>(
      builder: (blocContext, state) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return BlocProvider.value(
                      value: BlocProvider.of<AppointmentBloc>(
                        blocContext,
                      ),
                      child:
                          UpcomingDetailsPage(appointmentId: appointment.id));
                },
              ),
            );
          },
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: OriaCard(
                  borderColor: appointment.status == AppointmentStatus.finished
                      ? OriaColors.green
                      : OriaColors.iconButtonBackgound,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      OriaRoundedImage(
                        networkImage: appointment.expert.profilePicture,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${appointment.expert.firstName} ${appointment.expert.lastName}",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Text(
                            appointment.expert.specialty,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: OriaColors.green),
                          ),
                          Text(
                            "${appointment.date.toAbbreviationMonthDate(context, withTime: true)} (${AppLocalizations.of(context)!.minutes(appointment.duration)})",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Satoshi"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 96,
                  height: 28,
                  decoration: BoxDecoration(
                    color: switch (appointment.status) {
                      AppointmentStatus.upcoming => const Color(0xFF356F7B),
                      AppointmentStatus.missed => const Color(0xFFA4A4A4),
                      AppointmentStatus.canceled => const Color(0xFFF97F7F),
                      AppointmentStatus.finished => const Color(0xFFA0F1AD),
                      _ => Colors.white
                    },
                    borderRadius: BorderRadius.circular(40),
                  ),
                  margin: const EdgeInsets.only(right: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Text(
                    appointment.status.name.capitalize(),
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w500,
                      color: appointment.status == AppointmentStatus.finished
                          ? OriaColors.green
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
