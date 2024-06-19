import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/explore/business/model/program_model.dart';
import 'package:oria_pro/common/symptoms/business/model/symptom_content_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/symptom_programs_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/update_section_response_model.dart';
import 'package:oria_pro/client/moduls/explore/business/repository/explore_repository.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/entity/symptom_program.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/use_case/finish_section_use_case.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/use_case/start_section_use_case.dart';

import '../../../business/di/explore_locator.dart';
import '../../entity/learning_content.dart';
import '../../use_case/fetch_learning_content_use_case.dart';
import '../entity/program.dart';
import '../use_case/update_program_favourite_use_case.dart';

part 'programs_event.dart';
part 'programs_state.dart';

class ProgramsBloc extends Bloc<ProgramsEvent, ProgramsState> {
  ProgramsBloc() : super(const ProgramsInitial()) {
    on<FetchProgramsCategories>((event, emit) async {
      FetchLearningContentUseCase learningContentUseCase =
          ExploreLocator().get();
      try {
        emit(ProgramsCategoryLoading(
          content: state.content,
          programs: state.programs,
          selectedProgram: state.selectedProgram,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
        ));

        final result = await learningContentUseCase.execute(true);
        emit(ProgramsCategorySuccess(
          content: result,
          programs: state.programs,
          selectedProgram: state.selectedProgram,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
        ));
      } catch (e) {
        emit(ProgramsError(
          content: state.content,
          programs: state.programs,
          selectedProgram: state.selectedProgram,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
          errorMessage: e.toString(),
        ));
      }
    });
    on<FetchSymptomPrograms>((event, emit) async {
      ExploreRepository repository = ExploreLocator().get();
      try {
        emit(ProgramsCategoryLoading(
          content: state.content,
          programs: state.programs,
          selectedProgram: state.selectedProgram,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
        ));

        final programsModel =
            await repository.fetchSymptomPrograms(event.symptomId);
        emit(ProgramsCategorySuccess(
          content: state.content,
          programs: programsModel.results
              .map((program) => program.toProgram())
              .toList(),
          selectedProgram: state.selectedProgram,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
        ));
      } catch (e) {
        emit(ProgramsError(
          content: state.content,
          programs: state.programs,
          selectedProgram: state.selectedProgram,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
          errorMessage: e.toString(),
        ));
      }
    });
    on<FetchProgramDetails>((event, emit) async {
      ExploreRepository repository = ExploreLocator().get();
      try {
        emit(ProgramDetailsLoading(
          content: state.content,
          programs: state.programs,
          selectedProgram: state.selectedProgram,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
        ));

        final programsModel = await repository.fetchProgram(event.programId);
        emit(ProgramDetailsSuccess(
          content: state.content,
          programs: state.programs,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
          selectedProgram: programsModel.toSymptomProgram(),
        ));
      } catch (e) {
        emit(ProgramsError(
          content: state.content,
          programs: state.programs,
          selectedProgram: state.selectedProgram,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
          errorMessage: e.toString(),
        ));
      }
    });
    on<EnrollProgram>((event, emit) async {
      ExploreRepository repository = ExploreLocator().get();
      try {
        emit(EnrollProgramLoading(
          content: state.content,
          programs: state.programs,
          selectedProgram: state.selectedProgram,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
        ));

        await repository.enrollProgram(event.programId);

        emit(EnrollProgramSuccess(
          content: state.content,
          programs: state.programs,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
          selectedProgram: state.selectedProgram
              ?.copyWith(programStatus: LearningStatus.started),
        ));
      } catch (e) {
        emit(ProgramsError(
          content: state.content,
          programs: state.programs,
          selectedProgram: state.selectedProgram,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
          errorMessage: e.toString(),
        ));
      }
    });

    on<ResetProgram>((event, emit) async {
      ExploreRepository repository = ExploreLocator().get();
      try {
        emit(ResetProgramLoading(
          content: state.content,
          programs: state.programs,
          selectedProgram: state.selectedProgram,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
        ));

        await repository.resetProgram(event.programId);
        final SymptomProgram? resetedProgram = state.selectedProgram?.copyWith(
          sections: state.selectedProgram?.sections
              .map(
                (sec) => sec.copyWith(sectionStatus: LearningStatus.notStarted),
              )
              .toList(),
          programStatus: LearningStatus.notStarted,
        );

        emit(ResetProgramSuccess(
          content: state.content,
          programs: state.programs,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
          selectedProgram: resetedProgram,
        ));
      } catch (e) {
        emit(ProgramsError(
          content: state.content,
          programs: state.programs,
          selectedProgram: state.selectedProgram,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
          errorMessage: e.toString(),
        ));
      }
    });
    on<StartSection>((event, emit) async {
      StartSectionUseCase usecase = ExploreLocator().get();
      ExploreRepository repository = ExploreLocator().get();
      try {
        emit(UpdateSectionLoading(
          content: state.content,
          programs: state.programs,
          selectedProgram: state.selectedProgram,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
        ));

        final updated = event.sectionStatus == LearningStatus.notStarted
            ? await usecase.execute(event.programId, event.sectionId)
            : true;
        final selectedSection = (await repository.fetchSectionDetails(
                event.programId, event.sectionId))
            .toProgramSectionWithContent();
        if (updated) {
          SymptomProgram? program = state.selectedProgram?.copyWith();
          if (program != null) {
            List<ProgramSection> sections = List.from(program.sections);
            final sectionIndex =
                sections.indexWhere((section) => section.id == event.sectionId);
            if (sectionIndex != -1) {
              sections[sectionIndex] = selectedSection.copyWith(
                  sectionStatus:
                      event.sectionStatus == LearningStatus.notStarted
                          ? LearningStatus.started
                          : event.sectionStatus);
            }
            program = program.copyWith(sections: sections);
            emit(UpdateSectionSuccess(
              content: state.content,
              programs: state.programs,
              selectedProgram: program,
              selectedSection: selectedSection,
              mixedContent: state.mixedContent,
            ));
          }
        } else {
          emit(ProgramsError(
            content: state.content,
            programs: state.programs,
            selectedProgram: state.selectedProgram,
            selectedSection: state.selectedSection,
            mixedContent: state.mixedContent,
            errorMessage:
                "We encountered a problem starting this section. Please try again.",
          ));
        }
      } catch (e) {
        emit(ProgramsError(
          content: state.content,
          programs: state.programs,
          selectedProgram: state.selectedProgram,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
          errorMessage: e.toString(),
        ));
      }
    });
    on<FinishSection>((event, emit) async {
      FinishSectionUseCase usecase = ExploreLocator().get();
      try {
        emit(UpdateSectionLoading(
          content: state.content,
          programs: state.programs,
          selectedProgram: state.selectedProgram,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
        ));
        final updated = await usecase.execute(event.programId, event.sectionId);
        if (updated) {
          SymptomProgram? program = state.selectedProgram?.copyWith();
          if (program != null) {
            List<ProgramSection> sections = List.from(program.sections);
            final sectionIndex =
                sections.indexWhere((section) => section.id == event.sectionId);
            if (sectionIndex != -1) {
              sections[sectionIndex] = sections[sectionIndex]
                  .copyWith(sectionStatus: LearningStatus.finished);
            }
            program = program.copyWith(sections: sections);
            emit(UpdateSectionSuccess(
              content: state.content,
              programs: state.programs,
              selectedProgram: program,
              selectedSection: null,
              mixedContent: state.mixedContent,
            ));
          }
        } else {
          emit(ProgramsError(
            content: state.content,
            programs: state.programs,
            selectedProgram: state.selectedProgram,
            selectedSection: state.selectedSection,
            mixedContent: state.mixedContent,
            errorMessage:
                "We encountered a problem starting this section. Please try again.",
          ));
        }
      } catch (e) {
        emit(ProgramsError(
          content: state.content,
          programs: state.programs,
          selectedProgram: state.selectedProgram,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
          errorMessage: e.toString(),
        ));
      }
    });

    on<UpdateFavorite>((event, emit) async {
      UpdateProgramFavoriteUseCase usecase = ExploreLocator().get();
      try {
        final program = await usecase.execute(event.program);
        emit(FavoriteProgramSuccess(
          content: state.content,
          programs: state.programs,
          selectedProgram: program,
          selectedSection: null,
          mixedContent: state.mixedContent,
        ));
      } catch (e) {
        emit(ProgramsError(
          content: state.content,
          programs: state.programs,
          selectedProgram: state.selectedProgram,
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
          errorMessage: e.toString(),
        ));
      }
    });

    /*on<FetchSectionContent>((event, emit) async {
      LearningRepository learningRepository = ExploreLocator().get();
      try {
        emit(ProgramSectionsContentLoading(
          content: state.content,
          sections: state.sections,
          selectedSection: null,
        ));
        ProgramSectionWithContent programSections = await learningRepository
            .fetchProgramSectionContent(event.programId, event.sectionId);
        emit(
          ProgramSectionsContentSuccess(
            content: state.content,
            sections: state.sections,
            selectedSection: programSections.toProgramSectionUio(),
          ),
        );
      } catch (e) {
        emit(ProgramsError(
          content: state.content,
          sections: state.sections,
          errorMessage: e.toString(),
          selectedSection: state.selectedSection,
          mixedContent: state.mixedContent,
        ));
      }
    });*/
  }
}
