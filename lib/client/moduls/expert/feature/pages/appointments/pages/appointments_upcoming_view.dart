import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/widgets/appointment_card.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_snack_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/appointment_bloc.dart';

class UpcomingAppointmentListView extends StatelessWidget {
  const UpcomingAppointmentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentBloc()..add(FetchUpcomingAppointments()),
      child: BlocConsumer<AppointmentBloc, AppointmentState>(
        listener: (context, state) {
          if (state is AppointmentError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(OriaErrorSnackBar(content: state.errorMessage));
          }
        },
        builder: (context, state) {
          return state is FetchAllAppointmentsLoading
              ? const OriaLoadingProgress()
              : state.upcoming.isEmpty
                  ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            SvgAssets.noAppointmentsAsset,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            AppLocalizations.of(context)!.noAppointments,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            AppLocalizations.of(context)!.youHaveNoAppointments,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: OriaColors.darkGrey),
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            AppointmentCard(appointment: state.upcoming[index]),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemCount: state.upcoming.length,
                      ),
                    );
        },
      ),
    );
  }
}
