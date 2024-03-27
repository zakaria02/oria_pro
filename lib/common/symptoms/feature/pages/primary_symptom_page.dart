import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/common/onboarding/feature/cubit/onboarding_steps_cubit.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';

import '../../../../utils/constants/svg_assets.dart';
import '../../../../utils/router/router.dart';
import '../../../../widgets/oria_app_bar.dart';
import '../../../../widgets/oria_loading_progress.dart';
import '../../../../widgets/oria_scaffold.dart';
import '../../../../widgets/oria_snack_bar.dart';
import '../bloc/symptom_bloc.dart';
import '../widgets/symptom_card.dart';

@RoutePage()
class PrimarySymptomPage extends StatelessWidget {
  const PrimarySymptomPage({
    super.key,
    required this.onboardingStepsCubit,
  });

  final OnboardingStepsCubit onboardingStepsCubit;

  @override
  Widget build(BuildContext context) {
    final router = context.router;
    return BlocConsumer<SymptomBloc, SymptomState>(
      listener: (context, state) {
        if (state is SymptomError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(OriaErrorSnackBar(content: state.errorMessage));
        }
      },
      builder: (context, state) {
        return OriaScaffold(
          appBarData: AppBarData(
            firstButtonUrl: onboardingStepsCubit.state.currentIndex != 0
                ? SvgAssets.backAsset
                : null,
            onFirstButtonPress: () => onboardingStepsCubit.maybePop(),
            title: AppLocalizations.of(context)!.chooseSymptom,
          ),
          body: state is SymptomLoading
              ? const OriaLoadingProgress()
              : Expanded(
                  child: ListView(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.symptomBothering,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        AppLocalizations.of(context)!.chooseMainSymptom,
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
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                          itemBuilder: (context, index) => SymptomCard(
                            symptom: state.symptoms[index],
                            selected:
                                state.symptoms[index] == state.selectedSymptom,
                            onPress: () => BlocProvider.of<SymptomBloc>(context)
                                .add(SelectPrimarySymptom(
                                    symptom: state.symptoms[index])),
                          ),
                          itemCount: state.symptoms.length,
                        ),
                      )
                    ],
                  ),
                ),
          bottomNavigationBar: OriaRoundedButton(
            onPress: () async {
              if (state.selectedSymptom != null) {
                final result = await onboardingStepsCubit.updateData(
                    symptom: state.selectedSymptom!);
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
            disabled: state.selectedSymptom == null,
            text: AppLocalizations.of(context)!.next,
          ),
        );
      },
    );
  }
}
