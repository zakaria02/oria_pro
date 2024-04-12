import 'package:auto_route/auto_route.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/bloc/appointment_bloc.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/entity/appointment_details.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/utils/extensions/date_extensions.dart';
import 'package:oria_pro/widgets/oria_snack_bar.dart';

import '../../../../../../../widgets/oria_app_bar.dart';
import '../../../../../../../widgets/oria_card.dart';
import '../../../../../../../widgets/oria_dialog.dart';
import '../../../../../../../widgets/oria_rounded_button.dart';
import '../../../../../../../widgets/oria_scaffold.dart';
import '../widgets/appointment_cancel_dialog.dart';

@RoutePage()
class AppointmentRefundingPage extends StatelessWidget {
  const AppointmentRefundingPage({super.key, required this.appointment});
  final AppointmentDetails appointment;

  void _showDialog(BuildContext context) {
    context.router.popUntil((route) => route.isFirst);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return OriaDialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(SvgAssets.checkIcon),
              Text(
                AppLocalizations.of(context)!.successfully,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: "Raleway",
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)!.successfullyContent,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              OriaRoundedButton(
                padding: EdgeInsets.zero,
                onPress: () {
                  Navigator.of(context).pop();
                },
                text: "Ok",
              ),
            ],
          ),
        );
      },
    ).then((value) {
      if (value == true) {
        context.router.popUntilRoot();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentBloc, AppointmentState>(
      listener: (context, state) {
        if (state is AppointmentError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(OriaErrorSnackBar(content: state.errorMessage));
        }
        if (state is CancelAppointmentSuccess) {
          _showDialog(context);
        }
      },
      builder: (blocContext, state) {
        return OriaScaffold(
          appBarData: AppBarData(
            firstButtonUrl: SvgAssets.backAsset,
            onFirstButtonPress: state is CancelAppointmentLoading
                ? null
                : () => context.maybePop(),
          ),
          body: OriaCard(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.13),
                blurRadius: 4,
                offset: const Offset(0.0, 8),
              ),
            ],
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      AppLocalizations.of(context)!.refunding,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    appointment.expert.profilePicture),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${appointment.expert.firstName} ${appointment.expert.lastName}",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                appointment.expert.specialty,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(color: OriaColors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.date,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(color: OriaColors.disabledColor),
                          ),
                          const Spacer(),
                          Text(
                            appointment.date.toAbbreviationMonthDate(context),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontFamily: "Satoshi"),
                          ),
                          const SizedBox(width: 8),
                          SvgPicture.asset(
                            SvgAssets.calendarIcon,
                            height: 24,
                            width: 24,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.duration,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(color: OriaColors.disabledColor),
                          ),
                          const Spacer(),
                          Text(
                            AppLocalizations.of(context)!
                                .minutes(appointment.duration),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontFamily: "Satoshi"),
                          ),
                          const SizedBox(width: 8),
                          SvgPicture.asset(
                            SvgAssets.timePrimaryIcon,
                            height: 24,
                            width: 24,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const DottedLine(dashColor: OriaColors.disabledColor),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.total,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const Spacer(),
                          Text(
                            "${appointment.expert.consultationPrice} \$",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(fontFamily: "Satoshi"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomBarPadding: const EdgeInsets.only(bottom: 30),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              OriaRoundedButton(
                onPress: () => context.maybePop(),
                disabled: state is CancelAppointmentLoading,
                isLoading: state is CancelAppointmentLoading,
                text: AppLocalizations.of(context)!.cancel,
                primaryColor: OriaColors.scaffoldBackgroundColor,
                borderColor: OriaColors.green,
                textColor: OriaColors.green,
              ),
              const SizedBox(height: 8),
              OriaRoundedButton(
                onPress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return OriaDialog(
                        padding: const EdgeInsets.all(10),
                        child: AppointmentCancelDialog(
                            expertPicture: appointment.expert.profilePicture,
                            onYesPress: () => BlocProvider.of<AppointmentBloc>(
                                    blocContext)
                                .add(CancelAppointment(id: appointment.id))),
                      );
                    },
                  );
                },
                disabled: state is CancelAppointmentLoading,
                text: AppLocalizations.of(context)!.requestRefund,
              ),
            ],
          ),
        );
      },
    );
  }
}
