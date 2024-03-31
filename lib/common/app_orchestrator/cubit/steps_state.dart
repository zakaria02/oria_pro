part of 'steps_cubit.dart';

abstract class StepsState extends Equatable {
  const StepsState({required this.steps});
  final OnBoardingSteps? steps;

  @override
  List<Object?> get props => [steps];
}

final class StepsInitial extends StepsState {
  const StepsInitial({required super.steps});
}

final class StepsSuccess extends StepsState {
  const StepsSuccess({required super.steps});
}

final class StepsError extends StepsState {
  final String errorMessage;
  const StepsError({required super.steps, required this.errorMessage});
}
