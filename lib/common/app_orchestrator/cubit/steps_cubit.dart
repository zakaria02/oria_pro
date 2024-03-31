import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../auth/business/email_password/locator/email_password_locator.dart';
import '../../auth/feature/entity/onbaording_step.dart';
import '../../auth/feature/usecase/get_user_steps_use_case.dart';

part 'steps_state.dart';

class StepsCubit extends Cubit<StepsState> {
  StepsCubit() : super(const StepsInitial(steps: null));

  void getSteps() async {
    try {
      final GetUserStepsUseCase stepsUseCase = EmailPasswordAuthLocator().get();
      final OnBoardingSteps? steps = await stepsUseCase.execute();
      emit(StepsSuccess(steps: steps));
    } catch (e) {
      emit(StepsError(steps: state.steps, errorMessage: e.toString()));
    }
  }
}
