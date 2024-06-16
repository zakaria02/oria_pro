import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/common/onboarding/feature/cubit/onboarding_steps_cubit.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';

import '../../../../utils/constants/svg_assets.dart';
import '../../../../utils/router/router.dart';
import '../../../../widgets/oria_app_bar.dart';
import '../../../../widgets/oria_scaffold.dart';
import '../../../../widgets/oria_snack_bar.dart';
import '../bloc/symptom_bloc.dart';
import '../widgets/symptom_card.dart';

@RoutePage()
class SecondarySymptomsPage extends StatelessWidget {
  const SecondarySymptomsPage({
    super.key,
    required this.onboardingStepsCubit,
  });

  final OnboardingStepsCubit onboardingStepsCubit;
  @override
  Widget build(BuildContext context) {
    final router = context.router;
    return BlocBuilder<SymptomBloc, SymptomState>(builder: (context, state) {
      final otherSymptoms = state.symptoms
          .where(
              (symptom) => symptom != onboardingStepsCubit.state.primarySymptom)
          .toList();
      return OriaScaffold(
          appBarData: AppBarData(
            firstButtonUrl: onboardingStepsCubit.state.currentIndex != 0
                ? SvgAssets.backAsset
                : null,
            onFirstButtonPress: () => onboardingStepsCubit.maybePop(),
            title: AppLocalizations.of(context)!.chooseSymptom,
          ),
          body: Expanded(
            child: ListView(
              children: [
                Text(
                  AppLocalizations.of(context)!.symptomsBothering,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context)!.secondarySymptomsDescription,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) => SymptomCard(
                      symptom: otherSymptoms[index],
                      selected: state.secondarySymptoms
                          .contains(otherSymptoms[index]),
                      onPress: () => BlocProvider.of<SymptomBloc>(context).add(
                        UpdateSecondarySymptoms(
                          symptom: otherSymptoms[index],
                        ),
                      ),
                    ),
                    itemCount: otherSymptoms.length,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          bottomNavigationBar: OriaRoundedButton(
            onPress: () async {
              if (state.secondarySymptoms.isNotEmpty) {
                final result = await onboardingStepsCubit.updateData(
                    secondarySymptoms: state.secondarySymptoms);
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
            disabled: state.secondarySymptoms.isEmpty,
            text: AppLocalizations.of(context)!.next,
          ));
    });
  }
}
