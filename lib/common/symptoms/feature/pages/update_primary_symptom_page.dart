import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/common/symptoms/feature/entity/symptom.dart';
import 'package:oria_pro/common/symptoms/feature/pages/update_todays_action_page.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/symptom_bloc.dart';
import '../entity/symptom_info.dart';
import '../widgets/symptom_card.dart';

@RoutePage()
class UpdatePrimarySymptomPage extends StatefulWidget {
  const UpdatePrimarySymptomPage({
    super.key,
    required this.currentSymptom,
    required this.refresh,
  });

  final Symptom currentSymptom;
  final VoidCallback refresh;

  @override
  State<UpdatePrimarySymptomPage> createState() =>
      _UpdatePrimarySymptomPageState();
}

class _UpdatePrimarySymptomPageState extends State<UpdatePrimarySymptomPage> {
  SymptomInfo? selectedSymptom;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SymptomBloc, SymptomState>(
      listener: (blocContext, state) {
        if (state is UpdateSymptomsSuccess) {
          widget.refresh();
          BlocProvider.of<SymptomBloc>(blocContext)
              .add(const FetchTodaysActionPrograms());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return BlocProvider.value(
                  value: BlocProvider.of<SymptomBloc>(
                    blocContext,
                  ),
                  child: UpdateTodaysActionsProgramPage(
                    refresh: widget.refresh,
                  ),
                );
              },
            ),
          );
        }
      },
      builder: (blocContext, state) {
        final symptoms = state.symptoms
            .where((symp) => symp.symptomId != widget.currentSymptom.symptomId)
            .toList();
        return OriaScaffold(
          appBarData: AppBarData(
            firstButtonUrl: SvgAssets.backAsset,
            onFirstButtonPress: () => context.maybePop(),
            title: AppLocalizations.of(context)!.chooseSymptom,
          ),
          body: state is SymptomLoading
              ? const OriaLoadingProgress()
              : Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(height: 30),
                      SizedBox(
                        child: GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                          itemBuilder: (context, index) => SymptomCard(
                            symptom: symptoms[index],
                            selected: symptoms[index].symptomId ==
                                selectedSymptom?.symptomId,
                            onPress: () {
                              setState(() {
                                selectedSymptom = symptoms[index];
                              });
                            },
                          ),
                          itemCount: symptoms.length,
                        ),
                      ),
                    ],
                  ),
                ),
          bottomNavigationBar: OriaRoundedButton(
            onPress: () {
              if (selectedSymptom != null) {
                BlocProvider.of<SymptomBloc>(blocContext)
                    .add(ChangePrimarySymptom(symptom: selectedSymptom!));
              }
            },
            text: AppLocalizations.of(context)!.saveChanges,
            isLoading: state is UpdateSymptomsLoading,
            disabled: selectedSymptom == null,
          ),
        );
      },
    );
  }
}
