part of 'symptom_bloc.dart';

sealed class SymptomEvent extends Equatable {
  const SymptomEvent();

  @override
  List<Object> get props => [];
}

final class FetchAllSymptoms extends SymptomEvent {}

final class FetchUserSymptoms extends SymptomEvent {}

final class SelectPrimarySymptom extends SymptomEvent {
  final SymptomInfo symptom;

  const SelectPrimarySymptom({required this.symptom});
}

final class ChangePrimarySymptom extends SymptomEvent {
  final SymptomInfo symptom;

  const ChangePrimarySymptom({required this.symptom});
}

final class FetchTodaysActionPrograms extends SymptomEvent {
  const FetchTodaysActionPrograms();
}

final class SetTodaysActionsProgram extends SymptomEvent {
  final Program program;

  const SetTodaysActionsProgram({required this.program});
}

final class AddSecondarySymptoms extends SymptomEvent {
  final List<SymptomInfo> symptoms;

  const AddSecondarySymptoms({required this.symptoms});
}

final class UpdateSecondarySymptoms extends SymptomEvent {
  final SymptomInfo symptom;

  const UpdateSecondarySymptoms({required this.symptom});
}

final class GetSymptomData extends SymptomEvent {
  final Symptom symptom;

  const GetSymptomData({required this.symptom});
}
