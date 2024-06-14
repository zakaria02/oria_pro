import 'package:auto_route/auto_route.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/learning_article.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/entity/symptom_program.dart';
import 'package:oria_pro/client/moduls/home/feature/bloc/home_bloc.dart';
import 'package:oria_pro/client/moduls/home/feature/entity/daily_actions.dart';
import 'package:oria_pro/client/moduls/home/feature/widget/no_todays_actions.dart';
import 'package:oria_pro/common/symptoms/feature/entity/symptom.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/utils/router/router.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';

import '../../../../../../widgets/oria_icon_button.dart';
import '../../../../../widgets/oria_dialog.dart';

class DailyActionsSteps extends StatelessWidget {
  const DailyActionsSteps({
    super.key,
    required this.actions,
    required this.primarySymptom,
    required this.onStartHerePress,
    required this.finishSection,
    required this.name,
    required this.symptoms,
    required this.refreshTodaysAction,
  });
  final DailyActions actions;
  final String primarySymptom;
  final String name;
  final Function(bool, bool, bool) onStartHerePress;
  final Function(String, String) finishSection;
  final List<Symptom> symptoms;
  final VoidCallback refreshTodaysAction;

  bool get isProgramCurrent => !actions.completedProgramSection;

  bool get isArticleCurrent =>
      actions.completedProgramSection && !actions.readArticle;

  bool get congrats =>
      actions.completedProgramSection &&
      actions.readArticle &&
      actions.loggedSymptomSeverity;

  Color color(int? value) => switch (value) {
        0 => const Color(0xFFA8E4C2),
        1 => const Color(0xFFFEF3E0),
        2 => const Color(0xFFFFDAA5),
        3 => const Color(0xFFFF8888),
        4 => const Color(0xFFFF5858),
        _ => OriaColors.disabledColor,
      };

  Color textColor(int? value) => switch (value) {
        0 => const Color(0xFF1C7D45),
        1 => const Color(0xFF8B6525),
        2 => const Color(0xFF835B22),
        3 => const Color(0xFF6D1212),
        4 => const Color(0xFF8E1212),
        _ => OriaColors.disabledColor,
      };

  Widget steps(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Stack(
          children: [
            Positioned.fill(
              left: 12,
              top: isProgramCurrent && actions.section?.imageUrl != null
                  ? 130
                  : 50,
              bottom: 70,
              child: const OriaDottedLine(
                color: OriaColors.disabledColor,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      ActionStatusIcon(
                        finished: actions.completedProgramSection,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ActionCard(
                          finished: actions.completedProgramSection,
                          title: actions.section!.title,
                          imageUrl: actions.section!.imageUrl,
                          current: isProgramCurrent,
                          article: null,
                          section: actions.section,
                          isPremium: actions.section!.isPremium,
                          onStartPressed: () {
                            onStartHerePress(true, actions.readArticle,
                                actions.loggedSymptomSeverity);
                            finishSection(actions.section!.id,
                                actions.section!.programId);
                          },
                          loggedSymptom: actions.loggedSymptomSeverity,
                          userName: name,
                          symptoms: symptoms,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      ActionStatusIcon(
                        finished: actions.readArticle,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ActionCard(
                          finished: actions.readArticle,
                          title: actions.article!.title,
                          imageUrl: actions.article!.imageurl,
                          current: isArticleCurrent,
                          article: actions.article,
                          section: null,
                          isPremium: actions.article!.isPremium,
                          onStartPressed: () => onStartHerePress(
                            actions.completedProgramSection,
                            true,
                            actions.loggedSymptomSeverity,
                          ),
                          loggedSymptom: actions.loggedSymptomSeverity,
                          userName: name,
                          symptoms: symptoms,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      ActionStatusIcon(
                        finished: actions.loggedSymptomSeverity,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: OriaCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .howIsYouSymptomToday(primarySymptom),
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                const SizedBox(height: 12),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ...List.generate(
                                        5,
                                        (index) => GestureDetector(
                                          onTap: () {
                                            BlocProvider.of<HomeBloc>(context)
                                                .add(
                                              AddSymptomSeverity(
                                                severity: index,
                                                symptomId: symptoms
                                                    .where((symp) =>
                                                        symp.type ==
                                                        SymptomType.primary)
                                                    .first
                                                    .symptomId,
                                              ),
                                            );
                                            if (actions.readArticle &&
                                                actions
                                                    .completedProgramSection &&
                                                !actions
                                                    .loggedSymptomSeverity) {
                                              _showCongratsDialog(
                                                  context, name, symptoms);
                                            }
                                            onStartHerePress(
                                              actions.completedProgramSection,
                                              actions.readArticle,
                                              true,
                                            );
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 32,
                                                width: 32,
                                                margin: const EdgeInsets.only(
                                                  right: 6,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: color(index),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "$index",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                            fontFamily:
                                                                "Satoshi",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: textColor(
                                                                index)),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              if (index ==
                                                  actions.loggedSeverityValue)
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                    right: 6,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: color(index),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  height: 5,
                                                  width: 32,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      if (actions.loggedSeverityValue != null)
                                        Container(
                                          decoration: BoxDecoration(
                                            color: color(
                                                actions.loggedSeverityValue),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          height: 32,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 5),
                                          child: Text(
                                            switch (
                                                actions.loggedSeverityValue) {
                                              0 => AppLocalizations.of(context)!
                                                  .great,
                                              1 => AppLocalizations.of(context)!
                                                  .good,
                                              2 => AppLocalizations.of(context)!
                                                  .okay,
                                              3 => AppLocalizations.of(context)!
                                                  .bad,
                                              4 => AppLocalizations.of(context)!
                                                  .awful,
                                              _ => "",
                                            },
                                            style: TextStyle(
                                              color: textColor(
                                                  actions.loggedSeverityValue),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Raleway",
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.todaysAction,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontFamily: "Marcellus",
                fontWeight: FontWeight.w400,
              ),
        ),
        (actions.article != null && actions.section != null)
            ? steps(context)
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child:
                    NoTodaysActions(refreshTodaysAction: refreshTodaysAction),
              ),
      ],
    );
  }
}

class ActionCard extends StatefulWidget {
  const ActionCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.current,
    required this.section,
    required this.article,
    required this.isPremium,
    required this.onStartPressed,
    required this.finished,
    required this.loggedSymptom,
    required this.symptoms,
    required this.userName,
  });
  final String title;
  final String? imageUrl;
  final bool current;
  final bool isPremium;
  final ProgramSectionWithContent? section;
  final LearningArticle? article;
  final VoidCallback onStartPressed;
  final bool finished;
  final bool loggedSymptom;
  final String userName;
  final List<Symptom> symptoms;

  @override
  State<ActionCard> createState() => _ActionCardState();
}

class _ActionCardState extends State<ActionCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.finished) {
          if (widget.section != null) {
            context.pushRoute(SectionDetailsRoute(
                section: widget.section!, programName: widget.section!.title));
          } else {
            context.pushRoute(ArticleRoute(id: widget.article!.id));
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 50),
        child: OriaCard(
          backgroundColor: Colors.white,
          borderColor: OriaColors.iconButtonBackgound,
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              if (widget.imageUrl != null && widget.current)
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.imageUrl!,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(20, 20, 20, widget.current ? 5 : 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    if (widget.isPremium) ...[
                      const SizedBox(width: 8),
                      const OriaIconButton(
                        url: SvgAssets.premiumIcon,
                        size: 14,
                        raduis: 14,
                      ),
                    ]
                  ],
                ),
              ),
              if (widget.current)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: OriaRoundedButton(
                      padding: EdgeInsets.zero,
                      width: 160,
                      height: 34,
                      onPress: () {
                        widget.onStartPressed.call();
                        if (widget.section != null) {
                          context.pushRoute(SectionDetailsRoute(
                              section: widget.section!,
                              programName: widget.section!.title));
                        } else {
                          context
                              .pushRoute(ArticleRoute(id: widget.article!.id));
                          if (widget.loggedSymptom) {
                            _showCongratsDialog(
                                context, widget.userName, widget.symptoms);
                          }
                        }
                      },
                      text: AppLocalizations.of(context)!.startHere,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionStatusIcon extends StatelessWidget {
  final bool finished;

  const ActionStatusIcon({
    super.key,
    required this.finished,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      switch (finished) {
        true => SvgAssets.finishedSectionIcon,
        _ => SvgAssets.currentSectionIcon,
      },
    );
  }
}

class OriaDottedLine extends StatelessWidget {
  const OriaDottedLine({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      direction: Axis.vertical,
      dashColor: color,
    );
  }
}

void _showCongratsDialog(
    BuildContext context, String userName, List<Symptom> symptoms) {
  showDialog(
    context: context,
    builder: (context) {
      return OriaDialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: OriaIconButton(
                url: SvgAssets.closeAsset,
                onPress: Navigator.of(context).pop,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: SvgPicture.asset(SvgAssets.congratsAsset),
            ),
            const SizedBox(height: 32),
            Text(
              AppLocalizations.of(context)!.congratsContent(userName),
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontFamily: "Marcellus",
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            OriaRoundedButton(
              onPress: () =>
                  context.pushRoute(SymptomsListRoute(symptoms: symptoms)),
              text: AppLocalizations.of(context)!.keepLearningSymptoms,
            ),
            const SizedBox(height: 32),
          ],
        ),
      );
    },
  );
}
