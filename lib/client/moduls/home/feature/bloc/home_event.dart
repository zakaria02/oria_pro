part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class FetchUserInfo extends HomeEvent {}

final class FetchTodaysActions extends HomeEvent {}

final class FetchUserCurrentSymptoms extends HomeEvent {}

final class AddSymptomSeverity extends HomeEvent {
  final int severity;
  final String symptomId;

  const AddSymptomSeverity({
    required this.severity,
    required this.symptomId,
  });
}

final class SelectSymptom extends HomeEvent {
  final Symptom? symptom;

  const SelectSymptom({this.symptom});
}

final class FinishASection extends HomeEvent {
  final String sectionId;
  final String programId;

  const FinishASection({
    required this.sectionId,
    required this.programId,
  });
}

final class FinishAnAction extends HomeEvent {
  final bool completedProgramSection;
  final bool readArticle;
  final bool loggedSymptomSeverity;

  const FinishAnAction({
    required this.completedProgramSection,
    required this.readArticle,
    required this.loggedSymptomSeverity,
  });
}
