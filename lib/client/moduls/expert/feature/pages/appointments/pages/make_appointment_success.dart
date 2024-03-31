import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/entity/appointment.dart';
import 'package:oria_pro/common/auth/business/email_password/locator/email_password_locator.dart';
import 'package:oria_pro/common/auth/business/local_data_source/auth_local_data_source.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/utils/extensions/date_extensions.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';
import 'package:oria_pro/widgets/oria_rounded_image.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class MakeAppointmentSuccessPage extends StatefulWidget {
  const MakeAppointmentSuccessPage({
    super.key,
    required this.appointment,
  });
  final Appointment appointment;

  @override
  State<MakeAppointmentSuccessPage> createState() =>
      _MakeAppointmentSuccessPageState();
}

class _MakeAppointmentSuccessPageState
    extends State<MakeAppointmentSuccessPage> {
  String? name = "";

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final foundname = (await EmailPasswordAuthLocator()
              .get<AuthLocalDataSource>()
              .getUser())
          ?.name;
      setState(() {
        name = foundname;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OriaScaffold(
      body: Expanded(
        child: Center(
          child: OriaCard(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.13),
                blurRadius: 8,
                offset: const Offset(0.0, 8),
              ),
            ],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  SvgAssets.checkIcon,
                  height: 75,
                  width: 75,
                ),
                const SizedBox(height: 24),
                Text(
                  AppLocalizations.of(context)!.thanks(name ?? "", ""),
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
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
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
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
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
                  backgroundColor: OriaColors.iconButtonBackgound,
                  child: Row(
                    children: [
                      OriaRoundedImage(
                        networkImage: widget.appointment.expert.profilePicture,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.appointment.expert.firstName} ${widget.appointment.expert.lastName}",
                            style: Theme.of(context).textTheme.displayLarge,
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: OriaRoundedButton(
        onPress: () => context.router.popUntil((route) => route.isFirst),
        text: AppLocalizations.of(context)!.backToHome,
      ),
    );
  }
}
