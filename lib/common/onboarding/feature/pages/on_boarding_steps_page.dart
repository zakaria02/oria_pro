import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/bloc/programs_bloc.dart';
import 'package:oria_pro/common/auth/feature/entity/onbaording_step.dart';
import 'package:oria_pro/common/onboarding/feature/cubit/onboarding_steps_cubit.dart';
import 'package:oria_pro/common/onboarding/feature/pages/profil_calculation_page.dart';
import 'package:oria_pro/common/onboarding/feature/pages/update_birthday_page.dart';
import 'package:oria_pro/common/onboarding/feature/pages/update_name_page.dart';
import 'package:oria_pro/common/symptoms/feature/pages/primary_symptom_page.dart';
import 'package:oria_pro/common/symptoms/feature/pages/primary_symptom_severity_page.dart';
import 'package:oria_pro/common/symptoms/feature/pages/secondary_symptoms_page.dart';

import '../../../symptoms/feature/bloc/symptom_bloc.dart';
import '../../../symptoms/feature/pages/primary_symptom_programs_page.dart';

@RoutePage()
class OnBoardingStepsPage extends StatelessWidget {
  const OnBoardingStepsPage({super.key, required this.steps});
  final OnBoardingSteps steps;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingStepsCubit(steps)),
        BlocProvider(
            create: (context) => SymptomBloc()..add(FetchAllSymptoms())),
        BlocProvider(create: (context) => ProgramsBloc())
      ],
      child: BlocBuilder<OnboardingStepsCubit, OnboardingStepsState>(
        builder: (context, state) {
          final onboardingStepsCubit =
              BlocProvider.of<OnboardingStepsCubit>(context);
          return IndexedStack(
            index: state.currentIndex,
            children: [
              if (steps.name == null)
                UpdateNamePage(onboardingStepsCubit: onboardingStepsCubit),
              if (steps.birthDay == null)
                UpdateBirthdayPage(onboardingStepsCubit: onboardingStepsCubit),
              if (steps.primarySymptoms.isEmpty) ...[
                PrimarySymptomPage(
                  onboardingStepsCubit: onboardingStepsCubit,
                ),
                PrimarySymptomSeverityPage(
                  onboardingStepsCubit: onboardingStepsCubit,
                ),
                PrimarySymptomsProgramsPage(
                    onboardingStepsCubit: onboardingStepsCubit),
              ],
              if (steps.secondarySymptoms.isEmpty)
                SecondarySymptomsPage(
                  onboardingStepsCubit: onboardingStepsCubit,
                ),
              if (steps.stepsCount != 0)
                ProfilCalculationPage(
                  progress: onboardingStepsCubit.state.progress,
                  onboardingStepsCubit: onboardingStepsCubit,
                ),
            ],
          );
        },
      ),
    );
  }
}
