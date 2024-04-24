import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/entity/symptom_program.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/pages/section_details_page.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../widgets/oria_icon_button.dart';
import '../bloc/programs_bloc.dart';
import '../../../../../../widgets/oria_rounded_button.dart';

class ActionsSteps extends StatelessWidget {
  const ActionsSteps({
    super.key,
    this.expand = true,
    required this.program,
    required this.blocContext,
  });
  final bool expand;
  final SymptomProgram program;
  final BuildContext blocContext;

  Widget steps(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Stack(
          children: [
            Positioned.fill(
              left: 12,
              top: (program.sections.first.description.split(" ").length +
                      program.sections.first.title.split(" ").length) /
                  7 *
                  MediaQuery.of(context).size.width *
                  0.12,
              bottom: (program.sections.last.description.split(" ").length +
                          program.sections.last.title.split(" ").length) *
                      2 +
                  45,
              child: const OriaDottedLine(
                color: OriaColors.disabledColor,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: program.sections
                  .map(
                    (section) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          ActionStatusIcon(
                            status: section.sectionStatus ??
                                LearningStatus.notStarted,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ActionCard(
                              section: section,
                              program: program,
                              blocContext: blocContext,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (expand) {
      return Expanded(
        child: ListView(
          children: [steps(context)],
        ),
      );
    } else {
      return steps(context);
    }
  }
}

class ActionCard extends StatelessWidget {
  const ActionCard({
    super.key,
    required this.section,
    required this.program,
    required this.blocContext,
  });
  final ProgramSection section;
  final SymptomProgram program;
  final BuildContext blocContext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ProgramsBloc>(context).add(StartSection(
          programId: program.id,
          sectionId: section.id,
          sectionStatus: section.sectionStatus,
        ));

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return BlocProvider.value(
                value: BlocProvider.of<ProgramsBloc>(
                  blocContext,
                ),
                child: SectionDetailsPage(
                  programName: program.title,
                ),
              );
            },
          ),
        ).then((finished) {
          if (finished == true) {
            BlocProvider.of<ProgramsBloc>(context).add(FinishSection(
              programId: program.id,
              sectionId: section.id,
            ));
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  decoration: const BoxDecoration(
                    color: OriaColors.iconButtonBackgound,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  height: 262,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 5,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(height: 48),
                      Text(
                        AppLocalizations.of(context)!.greatJob,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.moveNextChapter,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      OriaRoundedButton(
                        text: AppLocalizations.of(context)!.imready,
                        onPress: () => Navigator.of(context).pop(),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              },
            );
          }
        });
      },
      child: OriaCard(
        backgroundColor: Colors.white,
        borderColor: switch (section.sectionStatus) {
          LearningStatus.started => OriaColors.grey,
          _ => null,
        },
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
                        text: "${section.title}: ",
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: OriaColors.primaryColor,
                                ),
                      ),
                      TextSpan(
                        text: section.description,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: OriaColors.primaryColor,
                                ),
                      ),
                    ]),
                  ),
                  if (section.duration > 0) ...[
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
                          AppLocalizations.of(context)!
                              .minutes(section.duration),
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
            if (section.isPremium) ...[
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
    );
  }
}

class ActionStatusIcon extends StatelessWidget {
  final LearningStatus status;

  const ActionStatusIcon({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      switch (status) {
        LearningStatus.finished => SvgAssets.finishedSectionIcon,
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
