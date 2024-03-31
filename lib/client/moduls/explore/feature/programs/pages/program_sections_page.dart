import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/bloc/programs_bloc.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../utils/constants/oria_colors.dart';
import '../../../../../../widgets/oria_app_bar.dart';
import '../../../../../../widgets/oria_no_data_view.dart';
import '../../../../../../widgets/oria_scaffold.dart';
import '../entity/symptom_program.dart';
import '../widgets/oria_sections.dart';

@RoutePage()
class ProgramSectionsPage extends StatelessWidget {
  const ProgramSectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramsBloc, ProgramsState>(
      builder: (blocContext, state) {
        final finished = state.selectedProgram?.sections
                .every((sec) => sec.sectionStatus == LearningStatus.finished) ==
            true;
        return OriaScaffold(
          appBarData: AppBarData(
            firstButtonUrl: SvgAssets.backAsset,
            onFirstButtonPress: () => context.maybePop(),
            title: state.selectedProgram?.title,
          ),
          body: state.selectedProgram?.sections == null ||
                  state.selectedProgram!.sections.isEmpty
              ? OriaNoDataView(
                  message: AppLocalizations.of(context)!.noSectionsFound)
              : Expanded(
                  child: Column(
                    children: [
                      Visibility(
                        visible: state.selectedProgram?.programStatus ==
                                LearningStatus.finished ||
                            finished,
                        child: Container(
                          decoration: BoxDecoration(
                            color: OriaColors.greenLight,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.only(
                              top: 24, bottom: 12, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.finishedProgram,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      color: OriaColors.green,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                AppLocalizations.of(context)!.retakeProgram,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                      color: Colors.black,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  BlocProvider.of<ProgramsBloc>(context).add(
                                    ResetProgram(
                                        programId: state.selectedProgram!.id),
                                  );
                                  context.router.maybePop();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: OriaColors.green,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    AppLocalizations.of(context)!.resetProgram,
                                    style: const TextStyle(
                                      fontFamily: "Raleway",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ActionsSteps(
                        program: state.selectedProgram!,
                        blocContext: blocContext,
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
