import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oria_pro/client/moduls/tracker/feature/bloc/tracker_bloc.dart';
import 'package:oria_pro/client/moduls/tracker/feature/widget/activity_card.dart';
import 'package:oria_pro/client/moduls/tracker/feature/widget/logger_card.dart';
import 'package:oria_pro/client/moduls/tracker/feature/widget/severity_card.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/widgets/oria_snack_bar.dart';

import '../enitity/activity.dart';
import '../enitity/tracked_symptom.dart';

class TrackedSymptomCard extends StatelessWidget {
  const TrackedSymptomCard({
    super.key,
    required this.symptom,
    required this.logSymptom,
    required this.logActivity,
  });
  final TrackedSymptom symptom;
  final Function(TrackedSymptom symptom) logSymptom;
  final Function(String logEventId, List<Activity>) logActivity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: OriaCard(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    symptom.name,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: const Color(0xFF3C3C3C),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (symptom.isPrimary) ...[
                    const SizedBox(width: 8),
                    SvgPicture.asset(SvgAssets.primaryStarIcon),
                  ],
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF61E89B),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          SvgAssets.insightsIcon,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          AppLocalizations.of(context)!.viewInsights,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.w700,
                            fontSize: 11,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Divider(
              color: Color(0xFFFAFAFA),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  symptom.logEventValue == null
                      ? LoggerCard(
                          title: AppLocalizations.of(context)!.logSeverity,
                          onPress: () => logSymptom(symptom),
                        )
                      : SeverityCard(
                          severity: symptom.logEventValue!,
                          onPress: () => logSymptom(symptom),
                        ),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context)!.todaysActivity,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: const Color(0xFF3C3C3C)),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 6,
                    runSpacing: 12,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      ...symptom.loggedActivities
                          .map(
                            (activity) => ActivityCard(
                              activity: activity,
                              onCrossPressed: () =>
                                  BlocProvider.of<TrackerBloc>(context).add(
                                RemoveSymptomActivity(
                                  activityId: activity.id,
                                  logEventId: symptom.logEventId!,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      if (symptom.loggedActivities.length < 3)
                        LoggerCard(
                          title: AppLocalizations.of(context)!.addActivity,
                          onPress: () {
                            if (symptom.logEventId != null) {
                              logActivity(symptom.logEventId!,
                                  symptom.loggedActivities);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                OriaErrorSnackBar(
                                  content: AppLocalizations.of(context)!
                                      .mustLogSeverity,
                                ),
                              );
                            }
                          },
                        )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
