import 'package:auto_route/auto_route.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/widgets/period_availabilities.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/utils/extensions/date_extensions.dart';
import 'package:oria_pro/utils/router/router.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_date_picker.dart';
import 'package:oria_pro/widgets/oria_dialog.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/widgets/oria_snack_bar.dart';

import '../../../entity/expert.dart';
import '../bloc/appointment_bloc.dart';
import '../../../../../../../common/widgets/bar_date_picker.dart';

@RoutePage()
class MakeAppointmentPage extends StatefulWidget {
  const MakeAppointmentPage({
    super.key,
    required this.expert,
  });
  final Expert expert;

  @override
  State<MakeAppointmentPage> createState() => _MakeAppointmentPageState();
}

class _MakeAppointmentPageState extends State<MakeAppointmentPage> {
  DateTime selectedDate = DateTime.now();
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentBloc()
        ..add(GetDayAvailabilities(
            day: selectedDate, expertId: widget.expert.id)),
      child: BlocConsumer<AppointmentBloc, AppointmentState>(
        listener: (context, state) {
          if (state is AppointmentError) {
            ScaffoldMessenger.of(context).showSnackBar(OriaErrorSnackBar(
                content: AppLocalizations.of(context)!.error_default));
          } else if (state is CreateAppointmentSuccess) {
            context.router.replace(
                MakeAppointmentSuccessRoute(appointment: state.appointment));
          }
        },
        builder: (blocContext, state) {
          return OriaScaffold(
            appBarData: AppBarData(
              firstButtonUrl: SvgAssets.backAsset,
              onFirstButtonPress: () => context.maybePop(),
              title: AppLocalizations.of(context)!.appointment,
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
                  // ignore: use_build_context_synchronously
                  BlocProvider.of<AppointmentBloc>(blocContext).add(
                    GetDayAvailabilities(day: date, expertId: widget.expert.id),
                  );
                }
              },
            ),
            body: Column(
              children: [
                BarDatePicker(
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 356)),
                  selectedDate: selectedDate,
                  controller: _controller,
                  onDateSelect: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                    BlocProvider.of<AppointmentBloc>(blocContext).add(
                        GetDayAvailabilities(
                            day: date, expertId: widget.expert.id));
                  },
                ),
                const SizedBox(height: 24),
                Visibility(
                  visible: state is GetDayAvailabilityLoading,
                  child: const OriaLoadingProgress(),
                ),
                selectedDate.day == DateTime.now().day
                    ? Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE3E3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.fullyBooked,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFFFC4646),
                                  ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              AppLocalizations.of(context)!
                                  .noAppointmentsForDate,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF8C8585),
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    : Visibility(
                        visible: state is! GetDayAvailabilityLoading,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            if (state.morningAvailabilities.isNotEmpty)
                              PeriodAvailabilities(
                                  title: AppLocalizations.of(context)!.morning,
                                  availabilities: state.morningAvailabilities,
                                  suffix: "AM"),
                            if (state.afternoonAvailabilities.isNotEmpty) ...[
                              const SizedBox(height: 32),
                              PeriodAvailabilities(
                                title: AppLocalizations.of(context)!.afternoon,
                                availabilities: state.afternoonAvailabilities,
                                suffix: "PM",
                              ),
                            ],
                            if (state.eveningAvailabilities.isNotEmpty) ...[
                              const SizedBox(height: 32),
                              PeriodAvailabilities(
                                title: AppLocalizations.of(context)!.evening,
                                availabilities: state.eveningAvailabilities,
                                suffix: "PM",
                              ),
                            ],
                          ],
                        ),
                      ),
              ],
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (state.selectedDate != null)
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.appointmentTime,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        Expanded(
                          child: Text(
                            state.selectedDate!.date.toDetailedDate(context),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontFamily: "Satoshi"),
                          ),
                        )
                      ],
                    ),
                  const SizedBox(height: 12),
                  OriaRoundedButton(
                    isLoading: state is CreateAppointmentLoading,
                    disabled: state.selectedDate == null,
                    padding: EdgeInsets.zero,
                    onPress: () =>
                        BlocProvider.of<AppointmentBloc>(blocContext).add(
                      CreateAppointment(
                        expertId: widget.expert.id,
                        appointmentDate: state.selectedDate!.date,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Flexible(
                          flex: 1,
                          child: SizedBox(
                            width: double.infinity,
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          child: Text(
                            AppLocalizations.of(context)!.goToPayment,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              "\$${widget.expert.consultationPrice}",
                              textAlign: TextAlign.end,
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
      ),
    );
  }
}
