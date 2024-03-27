part of 'symptom_bloc.dart';

sealed class SymptomEvent extends Equatable {
  const SymptomEvent();

  @override
  List<Object> get props => [];
}

final class FetchAllSymptoms extends SymptomEvent {}

final class SelectPrimarySymptom extends SymptomEvent {
  final SymptomInfo symptom;

  const SelectPrimarySymptom({required this.symptom});
}

final class UpdateSecondarySymptoms extends SymptomEvent {
  final SymptomInfo symptom;

  const UpdateSecondarySymptoms({required this.symptom});
}

final class GetSymptomData extends SymptomEvent {
  final Symptom symptom;

  const GetSymptomData({required this.symptom});
}
