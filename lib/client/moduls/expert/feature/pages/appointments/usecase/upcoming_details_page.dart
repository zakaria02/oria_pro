import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/entity/appointment_details.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/pages/appointment_refunding_page.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/widgets/appointment_warning_dialog.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/utils/extensions/date_extensions.dart';
import 'package:oria_pro/utils/extensions/duration_extensions.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:oria_pro/widgets/oria_dialog.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../../utils/constants/oria_colors.dart';
import '../../../../../../../widgets/oria_rounded_image.dart';
import '../bloc/appointment_bloc.dart';

@RoutePage()
class UpcomingDetailsPage extends StatefulWidget {
  const UpcomingDetailsPage({super.key, required this.appointment});
  final AppointmentDetails appointment;

  @override
  State<UpcomingDetailsPage> createState() => _UpcomingDetailsPageState();
}

class _UpcomingDetailsPageState extends State<UpcomingDetailsPage> {
  Duration? duration;
  late Timer _timer;

  _showDialog(BuildContext context, String title, String subTitle,
      {String? description}) {
    showDialog(
      context: context,
      builder: (context) {
        return OriaDialog(
          padding: const EdgeInsets.all(5),
          child: AppointmentWarningDialog(
            title: title,
            subTitle: subTitle,
            description: description,
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      setState(() {
        duration = widget.appointment.date.difference(DateTime.now());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentBloc, AppointmentState>(
      builder: (blocContext, state) {
        return OriaScaffold(
          appBarData: AppBarData(
            firstButtonUrl: SvgAssets.backAsset,
            onFirstButtonPress: () => context.maybePop(),
            title: AppLocalizations.of(context)!.appointment,
          ),
          body: Expanded(
            child: ListView(
              children: [
                OriaCard(
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.appointment,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontFamily: "Raleway"),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        AppLocalizations.of(context)!.appointmentDetails,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const Divider(
                        height: 1,
                        color: OriaColors.greenLight,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.when,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const Spacer(),
                          Text(
                            widget.appointment.date.toAbbreviationMonthDate(
                              context,
                              withTime: true,
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontFamily: "Satoshi"),
                          ),
                          const SizedBox(width: 8),
                          SvgPicture.asset(SvgAssets.calendarIcon),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.duration,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const Spacer(),
                          Text(
                            AppLocalizations.of(context)!
                                .minutes(widget.appointment.duration),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontFamily: "Satoshi"),
                          ),
                          const SizedBox(width: 8),
                          SvgPicture.asset(SvgAssets.timePrimaryIcon),
                        ],
                      ),
                      const SizedBox(height: 24),
                      OriaCard(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.13),
                            blurRadius: 4,
                            offset: const Offset(0.0, 4),
                          ),
                        ],
                        backgroundColor: OriaColors.scaffoldBackgroundColor,
                        child: Row(
                          children: [
                            OriaRoundedImage(
                              networkImage:
                                  widget.appointment.expert.profilePicture,
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.appointment.expert.firstName} ${widget.appointment.expert.lastName}",
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                Text(
                                  widget.appointment.expert.specialty,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: OriaColors.green),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 36),
                      if (duration != null)
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: OriaColors.greenLight,
                            border: Border.all(color: OriaColors.dividerColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 20),
                          child: Column(
                            children: [
                              SvgPicture.asset(SvgAssets.timerIcon),
                              const SizedBox(height: 12),
                              Text(
                                AppLocalizations.of(context)!.startsIn(
                                    duration!.formatDuration(context)),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(
                                      fontFamily: "Satoshi",
                                      color: OriaColors.green,
                                    ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      const SizedBox(height: 58),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (duration!.inHours < 24) {
                                  _showDialog(
                                    context,
                                    AppLocalizations.of(context)!.youCantCancel,
                                    AppLocalizations.of(context)!
                                        .cancel24BeforOnly,
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return BlocProvider.value(
                                          value:
                                              BlocProvider.of<AppointmentBloc>(
                                            blocContext,
                                          ),
                                          child: AppointmentRefundingPage(
                                            appointment: widget.appointment,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                height: 33,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: OriaColors.green),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)!.cancel,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          color: OriaColors.green,
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 22),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (duration!.inMinutes > 10) {
                                  _showDialog(
                                    context,
                                    AppLocalizations.of(context)!.istNotTime,
                                    AppLocalizations.of(context)!.youCanStartIn,
                                    description:
                                        duration!.formatDuration(context),
                                  );
                                }
                              },
                              child: Container(
                                height: 33,
                                decoration: BoxDecoration(
                                  color: OriaColors.green,
                                  border: Border.all(color: OriaColors.green),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)!.startNow,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
