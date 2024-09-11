import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/client/moduls/tracker/feature/page/edit_activities_page.dart';
import 'package:oria_pro/client/moduls/tracker/feature/widget/activity_selector.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../utils/constants/oria_colors.dart';
import '../../../../../widgets/oria_rounded_button.dart';
import '../../../../../widgets/oria_snack_bar.dart';
import '../bloc/tracker_bloc.dart';
import '../enitity/activity.dart';

class LogActivityPage extends StatefulWidget {
  const LogActivityPage({
    super.key,
    required this.logEventId,
    required this.activities,
  });
  final String logEventId;
  final List<Activity> activities;

  @override
  State<LogActivityPage> createState() => _LogActivityPageState();
}

class _LogActivityPageState extends State<LogActivityPage> {
  Activity? selectedActivity;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrackerBloc, TrackerState>(
      listener: (blocContext, state) {
        if (state is AddSymptomActivitySuccess) {
          context.maybePop();
        } else if (state is TrackedDataError) {
          ScaffoldMessenger.of(context).showSnackBar(OriaErrorSnackBar(
              content: AppLocalizations.of(context)!.error_default));
        }
      },
      builder: (blocContext, state) {
        return OriaScaffold(
          appBarData: AppBarData(
            firstButtonUrl: SvgAssets.backAsset,
            onFirstButtonPress: () => context.maybePop(),
            title: AppLocalizations.of(context)!.assesment,
          ),
          body: Expanded(
            child: Column(
              children: [
                const SizedBox(height: 24),
                Text(
                  AppLocalizations.of(context)!.whatDidYouDoToday,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: OriaColors.green,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Raleway",
                      ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context)!.whatDidYouDoTodayDescription,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: OriaColors.grey,
                      ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 28),
                state is FetchActivitiesLoading
                    ? const OriaLoadingProgress()
                    : Expanded(
                        child: Stack(
                          children: [
                            ListView(
                              children: [
                                GridView.count(
                                  crossAxisCount: 3,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  mainAxisSpacing: 12,
                                  crossAxisSpacing: 12,
                                  children:
                                      // Display a maximum of 12 activities
                                      state.activities.map((activity) {
                                    return ActivitySelector(
                                      disabled: widget.activities
                                          .where((act) => act.id == activity.id)
                                          .isNotEmpty,
                                      activity: activity,
                                      onActivitySelect: (act) {
                                        setState(
                                          () {
                                            selectedActivity = act;
                                          },
                                        );
                                      },
                                      selected: activity == selectedActivity,
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(height: 72)
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<TrackerBloc>(context)
                                    .add(FetchLocalActivities());
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return BlocProvider.value(
                                        value: BlocProvider.of<TrackerBloc>(
                                          blocContext,
                                        ),
                                        child: EditActivitiesPage(
                                          activites: state.activities,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 18),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 32,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color: OriaColors.greenLight,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!
                                              .editActivities,
                                        ),
                                        const SizedBox(width: 12),
                                        SvgPicture.asset(SvgAssets.settingsIcon)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
              ],
            ),
          ),
          bottomNavigationBar: Row(
            children: [
              Expanded(
                child: OriaRoundedButton(
                  onPress: () => context.maybePop(),
                  text: AppLocalizations.of(context)!.close,
                  primaryColor: OriaColors.scaffoldBackgroundColor,
                  borderColor: OriaColors.green,
                  textColor: OriaColors.green,
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: OriaRoundedButton(
                  onPress: () {
                    if (selectedActivity != null) {
                      BlocProvider.of<TrackerBloc>(blocContext).add(
                        AddSymptomActivity(
                            activityId: selectedActivity!.id,
                            logEventId: widget.logEventId),
                      );
                    }
                  },
                  text: AppLocalizations.of(context)!.save,
                  disabled: selectedActivity == null,
                  isLoading: state is AddSymptomActivityLoading,
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
