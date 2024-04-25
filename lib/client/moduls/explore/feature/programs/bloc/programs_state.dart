part of 'programs_bloc.dart';

sealed class ProgramsState extends Equatable {
  final List<LearningContent> content;
  final List<Program> programs;
  final SymptomProgram? selectedProgram;
  final ProgramSectionWithContent? selectedSection;
  final SymptomContentModel? mixedContent;

  const ProgramsState({
    required this.content,
    required this.programs,
    required this.selectedProgram,
    required this.selectedSection,
    required this.mixedContent,
  });

  @override
  List<Object?> get props => [content, programs, selectedProgram, mixedContent];
}

final class ProgramsInitial extends ProgramsState {
  const ProgramsInitial()
      : super(
          content: const [],
          programs: const [],
          selectedProgram: null,
          selectedSection: null,
          mixedContent: null,
        );
}

// PROGRAMS CATEGORIES //
final class ProgramsCategoryLoading extends ProgramsState {
  const ProgramsCategoryLoading({
    required super.content,
    required super.programs,
    required super.selectedProgram,
    required super.selectedSection,
    required super.mixedContent,
  });
}

final class ProgramsCategorySuccess extends ProgramsState {
  const ProgramsCategorySuccess({
    required super.content,
    required super.programs,
    required super.selectedProgram,
    required super.selectedSection,
    required super.mixedContent,
  });
}

// PROGRAMS DETAILS //

final class ProgramDetailsLoading extends ProgramsState {
  const ProgramDetailsLoading({
    required super.content,
    required super.programs,
    required super.selectedProgram,
    required super.selectedSection,
    required super.mixedContent,
  });
}

final class ProgramDetailsSuccess extends ProgramsState {
  const ProgramDetailsSuccess({
    required super.content,
    required super.programs,
    required super.selectedProgram,
    required super.selectedSection,
    required super.mixedContent,
  });
}

// PROGRAMS SECTION //

final class ProgramSectionsContentLoading extends ProgramsState {
  const ProgramSectionsContentLoading({
    required super.content,
    required super.programs,
    required super.selectedProgram,
    required super.selectedSection,
    required super.mixedContent,
  });
}

final class ProgramSectionsContentSuccess extends ProgramsState {
  const ProgramSectionsContentSuccess({
    required super.content,
    required super.programs,
    required super.selectedProgram,
    required super.selectedSection,
    required super.mixedContent,
  });
}

// ENROLL PROGRAMM //

final class EnrollProgramLoading extends ProgramsState {
  const EnrollProgramLoading({
    required super.content,
    required super.programs,
    required super.selectedProgram,
    required super.selectedSection,
    required super.mixedContent,
  });
}

final class EnrollProgramSuccess extends ProgramsState {
  const EnrollProgramSuccess({
    required super.content,
    required super.programs,
    required super.selectedProgram,
    required super.selectedSection,
    required super.mixedContent,
  });
}

// RESET PROGRAMM //

final class ResetProgramLoading extends ProgramsState {
  const ResetProgramLoading({
    required super.content,
    required super.programs,
    required super.selectedProgram,
    required super.selectedSection,
    required super.mixedContent,
  });
}

final class ResetProgramSuccess extends ProgramsState {
  const ResetProgramSuccess({
    required super.content,
    required super.programs,
    required super.selectedProgram,
    required super.selectedSection,
    required super.mixedContent,
  });
}

// UPDATE SECTION //

final class UpdateSectionLoading extends ProgramsState {
  const UpdateSectionLoading({
    required super.content,
    required super.programs,
    required super.selectedProgram,
    required super.selectedSection,
    required super.mixedContent,
  });
}

final class UpdateSectionSuccess extends ProgramsState {
  const UpdateSectionSuccess({
    required super.content,
    required super.programs,
    required super.selectedProgram,
    required super.selectedSection,
    required super.mixedContent,
  });
}

// ALL ERRORS //
final class ProgramsError extends ProgramsState {
  final String errorMessage;
  const ProgramsError({
    required this.errorMessage,
    required super.content,
    required super.programs,
    required super.selectedProgram,
    required super.selectedSection,
    required super.mixedContent,
  });
}
