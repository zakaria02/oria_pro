part of 'symptom_bloc.dart';

sealed class SymptomState extends Equatable {
  const SymptomState({
    required this.symptoms,
    required this.selectedSymptom,
    required this.secondarySymptoms,
    required this.symptomPrograms,
    required this.symptomArticles,
    required this.userSymptoms,
    required this.symptomForum,
  });
  final List<SymptomInfo> symptoms;
  final SymptomInfo? selectedSymptom;
  final List<SymptomInfo> secondarySymptoms;
  final List<Program> symptomPrograms;
  final ForumTopic? symptomForum;
  final List<SymptomArticle> symptomArticles;
  final List<Symptom> userSymptoms;

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
          userSymptoms: const [],
          symptomForum: null,
        );
}

final class SymptomLoading extends SymptomState {
  const SymptomLoading({
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
    required super.userSymptoms,
    required super.symptomForum,
  });
}

final class SymptomSuccess extends SymptomState {
  const SymptomSuccess({
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
    required super.userSymptoms,
    required super.symptomForum,
  });
}

final class UserSymptomsLoading extends SymptomState {
  const UserSymptomsLoading({
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
    required super.userSymptoms,
    required super.symptomForum,
  });
}

final class UserSymptomsSuccess extends SymptomState {
  const UserSymptomsSuccess({
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
    required super.userSymptoms,
    required super.symptomForum,
  });
}

final class AddSymptomLoading extends SymptomState {
  const AddSymptomLoading({
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
    required super.userSymptoms,
    required super.symptomForum,
  });
}

final class AddSymptomSuccess extends SymptomState {
  const AddSymptomSuccess({
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
    required super.userSymptoms,
    required super.symptomForum,
  });
}

final class SymptomDataLoading extends SymptomState {
  const SymptomDataLoading({
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
    required super.userSymptoms,
    required super.symptomForum,
  });
}

final class SymptomDataSuccess extends SymptomState {
  const SymptomDataSuccess({
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
    required super.userSymptoms,
    required super.symptomForum,
  });
}

final class UpdateSymptomsLoading extends SymptomState {
  const UpdateSymptomsLoading({
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
    required super.userSymptoms,
    required super.symptomForum,
  });
}

final class UpdateSymptomsSuccess extends SymptomState {
  const UpdateSymptomsSuccess({
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
    required super.userSymptoms,
    required super.symptomForum,
  });
}

final class DeleteSecondaryLoading extends SymptomState {
  const DeleteSecondaryLoading({
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
    required super.userSymptoms,
    required super.symptomForum,
  });
}

final class DeleteSecondarySuccess extends SymptomState {
  const DeleteSecondarySuccess({
    required super.symptoms,
    required super.selectedSymptom,
    required super.secondarySymptoms,
    required super.symptomPrograms,
    required super.symptomArticles,
    required super.userSymptoms,
    required super.symptomForum,
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
    required super.userSymptoms,
    required super.symptomForum,
  });
}
