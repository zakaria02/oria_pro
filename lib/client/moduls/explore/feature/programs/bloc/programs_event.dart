part of 'programs_bloc.dart';

sealed class ProgramsEvent extends Equatable {
  const ProgramsEvent();

  @override
  List<Object> get props => [];
}

final class FetchProgramsCategories extends ProgramsEvent {}

final class FetchSymptomPrograms extends ProgramsEvent {
  final String symptomId;

  const FetchSymptomPrograms({required this.symptomId});
}

final class FetchProgramDetails extends ProgramsEvent {
  final String programId;
  const FetchProgramDetails({required this.programId});
}

final class EnrollProgram extends ProgramsEvent {
  final String programId;
  const EnrollProgram({required this.programId});
}

final class ResetProgram extends ProgramsEvent {
  final String programId;
  const ResetProgram({required this.programId});
}

final class StartSection extends ProgramsEvent {
  final String programId;
  final String sectionId;
  final LearningStatus? sectionStatus;

  const StartSection(
      {required this.programId,
      required this.sectionId,
      required this.sectionStatus});
}

final class FinishSection extends ProgramsEvent {
  final String programId;
  final String sectionId;

  const FinishSection({
    required this.programId,
    required this.sectionId,
  });
}

/*final class FetchProgramSections extends ProgramsEvent {
  final String programId;
  const FetchProgramSections({required this.programId});
}

final class FetchSectionContent extends ProgramsEvent {
  final String programId;
  final String sectionId;
  const FetchSectionContent({required this.programId, required this.sectionId});
}*/
