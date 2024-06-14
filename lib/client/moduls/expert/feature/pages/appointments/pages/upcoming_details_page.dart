import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_filex/open_filex.dart';
import 'package:oria_pro/client/moduls/expert/business/locator/expert_locator.dart';
import 'package:oria_pro/client/moduls/expert/business/repository/expert_repository.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/entity/appointment_details.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/pages/appointment_refunding_page.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/widgets/appointment_warning_dialog.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/utils/extensions/date_extensions.dart';
import 'package:oria_pro/utils/extensions/duration_extensions.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:oria_pro/widgets/oria_dialog.dart';
import 'package:oria_pro/widgets/oria_rounded_input.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../../utils/constants/oria_colors.dart';
import '../../../../../../../widgets/oria_icon_button.dart';
import '../../../../../../../widgets/oria_rounded_button.dart';
import '../../../../../../../widgets/oria_rounded_image.dart';
import '../../../../business/service/permission_service.dart';
import '../bloc/appointment_bloc.dart';
import 'call_page.dart';

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
  double rating = 5;
  String comment = "";
  String? filePath;

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
                      if (duration != null &&
                          widget.appointment.status ==
                              AppointmentStatus.upcoming) ...[
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
                                      AppLocalizations.of(context)!
                                          .youCantCancel,
                                      AppLocalizations.of(context)!
                                          .cancel24BeforOnly,
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return BlocProvider.value(
                                            value: BlocProvider.of<
                                                AppointmentBloc>(
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
                                onTap: () async {
                                  final allGranted = await PermissionService
                                      .verifyPermissions();
                                  if (allGranted) {
                                    Navigator.push(
                                      // ignore: use_build_context_synchronously
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AppointmentCallPage(
                                          appointment: widget.appointment,
                                          onLeave: () {
                                            showDialog(
                                              context: blocContext,
                                              builder: (context) {
                                                return OriaDialog(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .rateAppointment(
                                                          widget.appointment
                                                              .expert.fullName,
                                                        ),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium
                                                            ?.copyWith(
                                                              fontFamily:
                                                                  "Raleway",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      const SizedBox(
                                                          height: 12),
                                                      RatingBar.builder(
                                                        initialRating: 5,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 5,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color:
                                                              Color(0xFFE8C889),
                                                        ),
                                                        onRatingUpdate: (r) {
                                                          rating = r;
                                                        },
                                                      ),
                                                      const SizedBox(
                                                          height: 12),
                                                      OriaRoundedInput(
                                                        hintText: "",
                                                        minLines: 3,
                                                        borderRadius: 12,
                                                        borderColor:
                                                            const Color(
                                                                0xFFE8C889),
                                                        validator: false,
                                                        onTextChange: (c) {
                                                          comment = c;
                                                        },
                                                      ),
                                                      const SizedBox(
                                                          height: 12),
                                                      OriaRoundedButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        height: 45,
                                                        onPress: () {
                                                          BlocProvider.of<
                                                                      AppointmentBloc>(
                                                                  blocContext)
                                                              .add(
                                                            AddReview(
                                                                appointmentId:
                                                                    widget
                                                                        .appointment
                                                                        .id,
                                                                review: comment,
                                                                rating: rating),
                                                          );
                                                          context.maybePop();
                                                        },
                                                        text:
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .send,
                                                        primaryColor:
                                                            const Color(
                                                                0xFFE8C889),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  } else {
                                    final statuses = await PermissionService
                                        .checkPermissions();
                                    final hasDenied = statuses.values.contains(
                                        PermissionStatus.permanentlyDenied);
                                    if (hasDenied) {
                                      showDialog(
                                        // ignore: use_build_context_synchronously
                                        context: context,
                                        builder: (context) {
                                          return OriaDialog(
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    SvgPicture.asset(
                                                      SvgAssets.warningIcon,
                                                    ),
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .deniedPermission,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleLarge
                                                          ?.copyWith(
                                                            fontFamily:
                                                                "Raleway",
                                                          ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .deniedPermissionContent,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayMedium
                                                          ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    const SizedBox(height: 24),
                                                    OriaRoundedButton(
                                                      padding: EdgeInsets.zero,
                                                      onPress: () =>
                                                          openAppSettings()
                                                              .then((value) =>
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop()),
                                                      text: AppLocalizations.of(
                                                              context)!
                                                          .manage,
                                                      primaryColor:
                                                          OriaColors.gold,
                                                      textColor: Colors.white,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }
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
                      if (widget.appointment.status ==
                              AppointmentStatus.finished &&
                          widget.appointment.hasFile)
                        GestureDetector(
                          onTap: () async {
                            if (filePath == null) {
                              final file = await ExpertLocator()
                                  .get<ExpertRepository>()
                                  .downloadPrescription(widget.appointment.id);
                              filePath = file.path;
                              OpenFilex.open(file.path);
                            } else {
                              OpenFilex.open(filePath);
                            }
                          },
                          child: Container(
                            height: 85,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: OriaColors.greenLight,
                              border: Border.all(color: OriaColors.green),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                const OriaIconButton(
                                  url: SvgAssets.recommendationIcon,
                                  backgroundColor: OriaColors.green,
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  AppLocalizations.of(context)!.recommendation,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                  SvgAssets.eyeActiveAsset,
                                  colorFilter: const ColorFilter.mode(
                                    OriaColors.green,
                                    BlendMode.srcIn,
                                  ),
                                )
                              ],
                            ),
                          ),
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
