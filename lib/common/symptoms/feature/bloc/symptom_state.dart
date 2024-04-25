part of 'symptom_bloc.dart';

sealed class SymptomState extends Equatable {
  const SymptomState({
    required this.symptoms,
    required this.selectedSymptom,
    required this.secondarySymptoms,
    required this.symptomPrograms,
    required this.symptomArticles,
  });
  final List<SymptomInfo> symptoms;
  final SymptomInfo? selectedSymptom;
  final List<SymptomInfo> secondarySymptoms;
  final List<Program> symptomPrograms;
  final List<SymptomArticle> symptomArticles;

  @override
  List<Object?> get props =>
      [symptoms, selectedSymptom, secondarySymptoms, symptomPrograms];
}

final class SymptomInitial extends SymptomState {
  const SymptomInitial()
      : super(
          symptoms: const [],
          selectedSymptom: null,
          secondarySymptoms: const [],
          symptomPrograms: const [],
          symptomArticles: const [],
        );
}

final class SymptomLoading extends SymptomState {
  const SymptomLoading({
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
  });
}

final class SymptomSuccess extends SymptomState {
  const SymptomSuccess({
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
  });
}

final class AddSymptomLoading extends SymptomState {
  const AddSymptomLoading({
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
  });
}

final class AddSymptomSuccess extends SymptomState {
  const AddSymptomSuccess({
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
  });
}

final class SymptomDataLoading extends SymptomState {
  const SymptomDataLoading({
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
  });
}

final class SymptomDataSuccess extends SymptomState {
  const SymptomDataSuccess({
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
  });
}

final class SymptomError extends SymptomState {
  final String errorMessage;

  const SymptomError({
    required this.errorMessage,
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
  });
}
