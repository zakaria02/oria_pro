import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/common/symptoms/feature/entity/symptom.dart';
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
class UpdateSecondarySymptomsPage extends StatefulWidget {
  const UpdateSecondarySymptomsPage({
    super.key,
    required this.currentSymptoms,
    required this.primarySymptom,
    required this.refresh,
  });

  final List<Symptom> currentSymptoms;
  final Symptom? primarySymptom;
  final VoidCallback refresh;

  @override
  State<UpdateSecondarySymptomsPage> createState() =>
      _UpdateSecondarySymptomsPageState();
}

class _UpdateSecondarySymptomsPageState
    extends State<UpdateSecondarySymptomsPage> {
  List<SymptomInfo> selectedSymptoms = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SymptomBloc, SymptomState>(
      listener: (context, state) {
        if (state is UpdateSymptomsSuccess) {
          context.router.popUntilRoot();
          widget.refresh();
        }
      },
      builder: (context, state) {
        final symptoms = state.symptoms
            .where(
              (symp) =>
                  !widget.currentSymptoms
                      .map((symp) => symp.symptomId)
                      .contains(symp.symptomId) &&
                  symp.symptomId != widget.primarySymptom?.symptomId,
            )
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
                            selected: selectedSymptoms
                                .map((symp) => symp.symptomId)
                                .contains(symptoms[index].symptomId),
                            onPress: () {
                              setState(() {
                                if (selectedSymptoms
                                    .contains(symptoms[index])) {
                                  selectedSymptoms.remove(symptoms[index]);
                                } else if ((selectedSymptoms.length +
                                        widget.currentSymptoms.length) <
                                    3) {
                                  selectedSymptoms.add(symptoms[index]);
                                }
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
              if (selectedSymptoms.isNotEmpty) {
                BlocProvider.of<SymptomBloc>(context)
                    .add(AddSecondarySymptoms(symptoms: selectedSymptoms));
              }
            },
            text: AppLocalizations.of(context)!.saveChanges,
            isLoading: state is UpdateSymptomsLoading,
            disabled: selectedSymptoms.isEmpty,
          ),
        );
      },
    );
  }
}
