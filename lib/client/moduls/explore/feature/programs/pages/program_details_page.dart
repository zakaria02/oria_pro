import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/entity/symptom_program.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/pages/program_sections_page.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_no_data_view.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';
import '../../../../../../common/widgets/author_card.dart';
import '../../../../../../widgets/oria_app_bar.dart';
import '../../../../../../widgets/oria_card.dart';
import '../../../../../../widgets/oria_scaffold.dart';

import '../bloc/programs_bloc.dart';

@RoutePage()
class ProgramDetailsPage extends StatelessWidget {
  const ProgramDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramsBloc, ProgramsState>(
      builder: (programBlocContext, programsState) {
        return OriaScaffold(
          appBarData: AppBarData(
            title: AppLocalizations.of(context)!.aboutProgram,
            firstButtonUrl: SvgAssets.backAsset,
            onFirstButtonPress: () => context.router.maybePop(),
          ),
          body: programsState is ProgramDetailsLoading
              ? const OriaLoadingProgress()
              : programsState.selectedProgram == null
                  ? OriaNoDataView(
                      message: AppLocalizations.of(context)!.programError)
                  : Expanded(
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 200,
                            child: AspectRatio(
                              aspectRatio: 3 / 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        programsState.selectedProgram!.image),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          OriaCard(
                            child: Column(
                              children: [
                                Text(
                                  programsState.selectedProgram!.title,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  programsState.selectedProgram!.description,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          AuthorCard(
                              author: programsState.selectedProgram!.author),
                        ],
                      ),
                    ),
          bottomNavigationBar: Visibility(
            visible: programsState.selectedProgram != null &&
                programsState is! ProgramDetailsLoading,
            child: OriaRoundedButton(
              onPress: () {
                if (programsState.selectedProgram?.programStatus ==
                    LearningStatus.notStarted) {
                  BlocProvider.of<ProgramsBloc>(context).add(EnrollProgram(
                    programId: programsState.selectedProgram?.id ?? "",
                  ));
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider.value(
                          value: BlocProvider.of<ProgramsBloc>(
                            programBlocContext,
                          ),
                          child: const ProgramSectionsPage());
                    },
                  ),
                );
              },
              text: programsState.selectedProgram?.programStatus ==
                      LearningStatus.notStarted
                  ? AppLocalizations.of(context)!.startProgram
                  : AppLocalizations.of(context)!.continue_key,
              isLoading: programsState is EnrollProgramLoading,
            ),
          ),
        );
      },
    );
  }
}
