import 'package:auto_route/auto_route.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:html/parser.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/learning_article.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/entity/symptom_program.dart';
import 'package:oria_pro/client/moduls/home/feature/entity/daily_actions.dart';
import 'package:oria_pro/common/symptoms/feature/entity/symptom.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/utils/router/router.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';

import '../../../../../../widgets/oria_icon_button.dart';

class DailyActionsSteps extends StatelessWidget {
  const DailyActionsSteps({
    super.key,
    required this.actions,
    required this.primarySymptom,
    required this.onStartHerePress,
    required this.name,
    required this.symptoms,
  });
  final DailyActions actions;
  final String primarySymptom;
  final String name;
  final Function(bool, bool, bool) onStartHerePress;
  final List<Symptom> symptoms;

  bool get isProgramCurrent => !actions.completedProgramSection;

  bool get isArticleCurrent =>
      actions.completedProgramSection && !actions.readArticle;

  bool get congrats =>
      actions.completedProgramSection &&
      actions.readArticle &&
      actions.loggedSymptomSeverity;

  String _extractTextFromHtml(String htmlString) {
    var document = parse(htmlString);
    return document.body?.text ?? "";
  }

  Widget steps(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Stack(
          children: [
            Positioned.fill(
              left: 12,
              top: isProgramCurrent ? 150 : 70,
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
                          title: actions.section.title,
                          description: actions.section.description,
                          imageUrl: actions.section.imageUrl,
                          current: isProgramCurrent,
                          duration: actions.section.duration,
                          article: null,
                          section: actions.section,
                          isPremium: actions.section.isPremium,
                          onStartPressed: () => onStartHerePress(
                              true,
                              actions.readArticle,
                              actions.loggedSymptomSeverity),
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
                          title: actions.article.title,
                          description:
                              _extractTextFromHtml(actions.article.htmlContent),
                          imageUrl: actions.article.imageurl,
                          current: isArticleCurrent,
                          duration: actions.article.duration,
                          article: actions.article,
                          section: null,
                          isPremium: actions.article.isPremium,
                          onStartPressed: () => onStartHerePress(
                              actions.completedProgramSection,
                              true,
                              actions.loggedSymptomSeverity),
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
                        child: OriaCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .howIsYouSymptomToday(primarySymptom),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: OriaColors.primaryColor,
                                    ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: List.generate(
                                  5,
                                  (index) => GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 32,
                                      width: 32,
                                      margin: const EdgeInsets.only(right: 6),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xFFFAF8F2),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${index + 1}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                fontFamily: "Satoshi",
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
    if (congrats) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: SvgPicture.asset(SvgAssets.congratsAsset),
          ),
          const SizedBox(height: 32),
          Text(
            AppLocalizations.of(context)!.congratsContent(name),
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
      );
    }
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
        steps(context),
      ],
    );
  }
}

class ActionCard extends StatelessWidget {
  const ActionCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.current,
    required this.duration,
    required this.section,
    required this.article,
    required this.isPremium,
    required this.onStartPressed,
  });
  final String title;
  final String description;
  final String? imageUrl;
  final bool current;
  final int duration;
  final bool isPremium;
  final ProgramSectionWithContent? section;
  final LearningArticle? article;
  final VoidCallback onStartPressed;

  @override
  Widget build(BuildContext context) {
    return OriaCard(
      backgroundColor: Colors.white,
      borderColor: OriaColors.iconButtonBackgound,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          if (imageUrl != null && current)
            Container(
              height: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    imageUrl!,
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
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "$title: ",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: OriaColors.primaryColor,
                                ),
                          ),
                          TextSpan(
                            text: description,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: OriaColors.primaryColor,
                                ),
                          ),
                        ]),
                      ),
                      if (duration > 0) ...[
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset(
                              SvgAssets.timeAsset,
                              colorFilter: const ColorFilter.mode(
                                  OriaColors.darkGrey, BlendMode.srcIn),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              AppLocalizations.of(context)!.minutes(duration),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: OriaColors.darkGrey,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: "Satoshi",
                                  ),
                            ),
                          ],
                        ),
                      ]
                    ],
                  ),
                ),
                if (isPremium) ...[
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
          if (current)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: OriaRoundedButton(
                  width: 150,
                  height: 34,
                  onPress: () {
                    onStartPressed.call();
                    if (section != null) {
                      context.pushRoute(SectionDetailsRoute(
                          section: section!, programName: section!.title));
                    } else {
                      context.pushRoute(ArticleRoute(id: article!.id));
                    }
                  },
                  text: AppLocalizations.of(context)!.startHere,
                ),
              ),
            ),
        ],
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
