import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/explore/business/di/explore_locator.dart';
import 'package:oria_pro/client/moduls/explore/business/repository/explore_repository.dart';
import 'package:oria_pro/common/auth/business/email_password/locator/email_password_locator.dart';
import 'package:oria_pro/common/auth/business/email_password/model/update_profile_request_model.dart';
import 'package:oria_pro/common/auth/business/email_password/repository/email_password_repository.dart';
import 'package:oria_pro/common/auth/feature/entity/onbaording_step.dart';
import 'package:oria_pro/common/symptoms/business/locator/symptom_locator.dart';
import 'package:oria_pro/common/symptoms/business/model/symptom_severity_request_model.dart';
import 'package:oria_pro/common/symptoms/business/repository/symptom_repository.dart';
import 'package:oria_pro/common/symptoms/feature/usecase/add_primay_symptom_use_case.dart';

import '../../../../client/moduls/explore/feature/programs/entity/program.dart';
import '../../../symptoms/feature/entity/symptom_info.dart';
import '../../../symptoms/feature/usecase/add_secondary_symptom.dart';

part 'onboarding_steps_state.dart';

class OnboardingStepsCubit extends Cubit<OnboardingStepsState> {
  OnboardingStepsCubit(OnBoardingSteps steps)
      : super(
          OnboardingStepsState(
            currentIndex: 0,
            progress: 0,
            maxIndex: steps.stepsCount,
          ),
        );

  Future<bool> updateData({
    SymptomInfo? symptom,
    int? severity,
    List<SymptomInfo>? secondarySymptoms,
    String? name,
    DateTime? birthDay,
    Program? program,
  }) async {
    final index = state.currentIndex + 1;
    emit(
      OnboardingStepsState(
        name: name ?? state.name,
        birthDay: birthDay ?? state.birthDay,
        primarySymptom: symptom ?? state.primarySymptom,
        primarySymptomSeverity: severity ?? state.primarySymptomSeverity,
        symptomProgram: state.symptomProgram ?? program,
        secondarySymptoms: secondarySymptoms ?? state.secondarySymptoms,
        currentIndex: index,
        progress: state.progress,
        maxIndex: state.maxIndex,
      ),
    );
    if (index == state.maxIndex) {
      await sendReponses();
      return true;
    }
    return false;
  }

  void maybePop() {
    final index = state.currentIndex - 1;
    if (index >= 0) {
      emit(
        OnboardingStepsState(
          name: state.name,
          birthDay: state.birthDay,
          primarySymptom: state.primarySymptom,
          primarySymptomSeverity: state.primarySymptomSeverity,
          symptomProgram: state.symptomProgram,
          secondarySymptoms: state.secondarySymptoms,
          currentIndex: index,
          progress: state.progress,
          maxIndex: state.maxIndex,
        ),
      );
    }
  }

  Future<void> sendReponses() async {
    AddPrimarySymptomUsecase addPrimarySymptomUsecase = SymptomLocator().get();
    AddSecondarySymptomUsecase addSecondarySymptomUsecase =
        SymptomLocator().get();
    SymptomRepository symptomRepository = SymptomLocator().get();
    EmailPasswordRepository emailPasswordRepository =
        EmailPasswordAuthLocator().get();
    ExploreRepository exploreRepository = ExploreLocator().get();

    try {
      await emailPasswordRepository.updateProfileInfo(
        UpdateProfileRequestModel(birthDay: state.birthDay, name: state.name),
      );

      emit(
        OnboardingStepsState(
          name: state.name,
          birthDay: state.birthDay,
          primarySymptom: state.primarySymptom,
          primarySymptomSeverity: state.primarySymptomSeverity,
          symptomProgram: state.symptomProgram,
          secondarySymptoms: state.secondarySymptoms,
          currentIndex: state.currentIndex,
          progress: 30,
          maxIndex: state.maxIndex,
        ),
      );

      if (state.primarySymptom != null) {
        await addPrimarySymptomUsecase.execute(state.primarySymptom!.symptomId);

        emit(
          OnboardingStepsState(
            name: state.name,
            birthDay: state.birthDay,
            primarySymptom: state.primarySymptom,
            primarySymptomSeverity: state.primarySymptomSeverity,
            symptomProgram: state.symptomProgram,
            secondarySymptoms: state.secondarySymptoms,
            currentIndex: state.currentIndex,
            progress: 45,
            maxIndex: state.maxIndex,
          ),
        );

        await symptomRepository.addSymptomSeverity(SymptomSeverityRequestModel(
          symptomId: state.primarySymptom!.symptomId,
          severity: state.primarySymptomSeverity,
          logDate: DateTime.now(),
        ));

        emit(
          OnboardingStepsState(
            name: state.name,
            birthDay: state.birthDay,
            primarySymptom: state.primarySymptom,
            primarySymptomSeverity: state.primarySymptomSeverity,
            symptomProgram: state.symptomProgram,
            secondarySymptoms: state.secondarySymptoms,
            currentIndex: state.currentIndex,
            progress: 60,
            maxIndex: state.maxIndex,
          ),
        );

        for (final symptom in state.secondarySymptoms) {
          await addSecondarySymptomUsecase.execute(symptom.symptomId);
        }
      }

      emit(
        OnboardingStepsState(
          name: state.name,
          birthDay: state.birthDay,
          primarySymptom: state.primarySymptom,
          primarySymptomSeverity: state.primarySymptomSeverity,
          symptomProgram: state.symptomProgram,
          secondarySymptoms: state.secondarySymptoms,
          currentIndex: state.currentIndex,
          progress: 85,
          maxIndex: state.maxIndex,
        ),
      );

      if (state.symptomProgram != null) {
        await exploreRepository.enrollProgram(state.symptomProgram!.id);

        emit(
          OnboardingStepsState(
            name: state.name,
            birthDay: state.birthDay,
            primarySymptom: state.primarySymptom,
            primarySymptomSeverity: state.primarySymptomSeverity,
            symptomProgram: state.symptomProgram,
            secondarySymptoms: state.secondarySymptoms,
            currentIndex: state.currentIndex,
            progress: 100,
            maxIndex: state.maxIndex,
          ),
        );
      }
    } catch (e) {
      emit(
        OnboardingStepsState(
          name: state.name,
          birthDay: state.birthDay,
          primarySymptom: state.primarySymptom,
          primarySymptomSeverity: state.primarySymptomSeverity,
          symptomProgram: state.symptomProgram,
          secondarySymptoms: state.secondarySymptoms,
          currentIndex: 0,
          progress: 0,
          maxIndex: state.maxIndex,
        ),
      );
    }
  }
}
