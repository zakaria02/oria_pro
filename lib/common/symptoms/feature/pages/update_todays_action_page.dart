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

import '../../../../utils/constants/svg_assets.dart';
import '../../../../widgets/oria_app_bar.dart';
import '../../../../widgets/oria_rounded_button.dart';
import '../bloc/symptom_bloc.dart';

@RoutePage()
class UpdateTodaysActionsProgramPage extends StatefulWidget {
  const UpdateTodaysActionsProgramPage({
    super.key,
    required this.refresh,
  });

  final VoidCallback refresh;

  @override
  State<UpdateTodaysActionsProgramPage> createState() =>
      _UpdateTodaysActionsProgramState();
}

class _UpdateTodaysActionsProgramState
    extends State<UpdateTodaysActionsProgramPage> {
  Program? selectedProgram;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SymptomBloc, SymptomState>(
      listener: (context, state) {
        if (state is SymptomError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(OriaErrorSnackBar(content: state.errorMessage));
        }
        if (state is UpdateSymptomsSuccess) {
          widget.refresh();
          context.router.popUntilRoot();
        }
      },
      builder: (blocContext, state) {
        return OriaScaffold(
          appBarData: AppBarData(
            firstButtonUrl: SvgAssets.closeAsset,
            onFirstButtonPress: () => context.router.popUntilRoot(),
            title: AppLocalizations.of(context)!.chooseProgram,
          ),
          body: state is SymptomDataLoading
              ? const OriaLoadingProgress()
              : Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      state.symptomPrograms.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.symptomPrograms.length,
                                itemBuilder: (context, index) =>
                                    ProgramSeggestionCard(
                                  program: state.symptomPrograms[index],
                                  selected: state.symptomPrograms[index] ==
                                      selectedProgram,
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
              if (selectedProgram != null || state.symptomPrograms.isEmpty) {
                BlocProvider.of<SymptomBloc>(blocContext)
                    .add(SetTodaysActionsProgram(program: selectedProgram!));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  OriaErrorSnackBar(
                    content: AppLocalizations.of(context)!.mustSelectSymptom,
                  ),
                );
              }
            },
            disabled: selectedProgram == null,
            isLoading: state is UpdateSymptomsLoading,
            text: AppLocalizations.of(context)!.saveChanges,
          ),
        );
      },
    );
  }
}
