import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/entity/program.dart';
import 'package:oria_pro/common/symptoms/feature/widgets/program_suggestion_card.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_no_data_view.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:oria_pro/widgets/oria_snack_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../client/moduls/explore/feature/programs/bloc/programs_bloc.dart';
import '../../../../utils/constants/svg_assets.dart';
import '../../../../utils/router/router.dart';
import '../../../../widgets/oria_app_bar.dart';
import '../../../../widgets/oria_rounded_button.dart';
import '../../../onboarding/feature/cubit/onboarding_steps_cubit.dart';

@RoutePage()
class PrimarySymptomsProgramsPage extends StatefulWidget {
  const PrimarySymptomsProgramsPage({
    super.key,
    required this.onboardingStepsCubit,
  });

  final OnboardingStepsCubit onboardingStepsCubit;

  @override
  State<PrimarySymptomsProgramsPage> createState() =>
      _PrimarySymptomsProgramsPageState();
}

class _PrimarySymptomsProgramsPageState
    extends State<PrimarySymptomsProgramsPage> {
  Program? selectedProgram;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProgramsBloc, ProgramsState>(
      listener: (context, state) {
        if (state is ProgramsError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(OriaErrorSnackBar(content: state.errorMessage));
        }
      },
      builder: (context, state) {
        final router = context.router;
        return OriaScaffold(
          appBarData: AppBarData(
            firstButtonUrl: widget.onboardingStepsCubit.state.currentIndex != 0
                ? SvgAssets.backAsset
                : null,
            onFirstButtonPress: () => widget.onboardingStepsCubit.maybePop(),
            title: AppLocalizations.of(context)!.chooseProgram,
          ),
          body: state is ProgramsCategoryLoading
              ? const OriaLoadingProgress()
              : Expanded(
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.symptomProgramsTitle(
                            widget.onboardingStepsCubit.state.primarySymptom
                                    ?.name ??
                                ""),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        AppLocalizations.of(context)!
                            .symptomProgramsDescription,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: Colors.grey[600],
                                ),
                      ),
                      SizedBox(height: state.programs.isNotEmpty ? 40 : 10),
                      state.programs.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.programs.length,
                                itemBuilder: (context, index) =>
                                    ProgramSeggestionCard(
                                  program: state.programs[index],
                                  selected:
                                      state.programs[index] == selectedProgram,
                                  onPress: (program) => setState(() {
                                    selectedProgram = program;
                                  }),
                                ),
                              ),
                            )
                          : OriaNoDataView(
                              message: AppLocalizations.of(context)!.noProgram,
                              height: 300,
                            ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
          bottomNavigationBar: OriaRoundedButton(
            onPress: () async {
              if (selectedProgram != null || state.programs.isEmpty) {
                final result = await widget.onboardingStepsCubit
                    .updateData(program: selectedProgram);
                if (result) {
                  router.replaceAll([const AppOrchestratorRoute()]);
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  OriaErrorSnackBar(
                    content: AppLocalizations.of(context)!.mustSelectSymptom,
                  ),
                );
              }
            },
            disabled: selectedProgram == null,
            text: AppLocalizations.of(context)!.next,
          ),
        );
      },
    );
  }
}
