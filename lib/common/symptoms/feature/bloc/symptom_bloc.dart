import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/explore/business/model/explore_symptom_article_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/explore_symptom_program_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/symptom_programs_model.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/learning_content.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/entity/program.dart';
import 'package:oria_pro/common/symptoms/business/model/user_symptom_model.dart';
import 'package:oria_pro/common/symptoms/business/model/user_symptom_request_model.dart';
import 'package:oria_pro/common/symptoms/feature/usecase/set_todays_actions_program_use_case.dart';

import '../../business/locator/symptom_locator.dart';
import '../../business/model/symptom_info_model.dart';
import '../../business/repository/symptom_repository.dart';
import '../entity/symptom.dart';
import '../entity/symptom_info.dart';

part 'symptom_event.dart';
part 'symptom_state.dart';

class SymptomBloc extends Bloc<SymptomEvent, SymptomState> {
  SymptomRepository repository = SymptomLocator().get();
  SymptomBloc() : super(const SymptomInitial()) {
    on<FetchAllSymptoms>((event, emit) async {
      emit(
        SymptomLoading(
          symptoms: state.symptoms,
          selectedSymptom: state.selectedSymptom,
          secondarySymptoms: state.secondarySymptoms,
          symptomPrograms: state.symptomPrograms,
          symptomArticles: state.symptomArticles,
          userSymptoms: state.userSymptoms,
        ),
      );
      try {
        List<SymptomInfoModel> symptoms = await repository.fetchAllSymptoms();
        emit(
          SymptomSuccess(
            symptoms: symptoms.map((sym) => sym.toSymptomInfo()).toList(),
            selectedSymptom: state.selectedSymptom,
            secondarySymptoms: state.secondarySymptoms,
            symptomPrograms: state.symptomPrograms,
            symptomArticles: state.symptomArticles,
            userSymptoms: state.userSymptoms,
          ),
        );
      } catch (e) {
        emit(SymptomError(
          errorMessage: e.toString(),
          symptoms: state.symptoms,
          selectedSymptom: state.selectedSymptom,
          secondarySymptoms: state.secondarySymptoms,
          symptomPrograms: state.symptomPrograms,
          symptomArticles: state.symptomArticles,
          userSymptoms: state.userSymptoms,
        ));
      }
    });

    on<SelectPrimarySymptom>((event, emit) async {
      emit(SymptomSuccess(
        symptoms: state.symptoms,
        selectedSymptom: event.symptom,
        secondarySymptoms: state.secondarySymptoms,
        symptomPrograms: state.symptomPrograms,
        symptomArticles: state.symptomArticles,
        userSymptoms: state.userSymptoms,
      ));
    });

    on<UpdateSecondarySymptoms>((event, emit) async {
      emit(
        SymptomLoading(
          symptoms: state.symptoms,
          selectedSymptom: state.selectedSymptom,
          secondarySymptoms: state.secondarySymptoms,
          symptomPrograms: state.symptomPrograms,
          symptomArticles: state.symptomArticles,
          userSymptoms: state.userSymptoms,
        ),
      );
      List<SymptomInfo> secSymptoms = List.from(state.secondarySymptoms);
      if (secSymptoms.contains(event.symptom)) {
        secSymptoms.remove(event.symptom);
      } else {
        secSymptoms.add(event.symptom);
      }
      emit(
        SymptomSuccess(
          symptoms: state.symptoms,
          selectedSymptom: event.symptom,
          secondarySymptoms: [...secSymptoms],
          symptomPrograms: state.symptomPrograms,
          symptomArticles: state.symptomArticles,
          userSymptoms: state.userSymptoms,
        ),
      );
    });

    on<GetSymptomData>((event, emit) async {
      try {
        emit(
          SymptomDataLoading(
            symptoms: state.symptoms,
            selectedSymptom: state.selectedSymptom,
            secondarySymptoms: state.secondarySymptoms,
            symptomPrograms: state.symptomPrograms,
            symptomArticles: state.symptomArticles,
            userSymptoms: state.userSymptoms,
          ),
        );
        SymptomRepository repository = SymptomLocator().get();
        final symptomContent =
            await repository.getSymptomContent(event.symptom.symptomId);
        emit(
          SymptomDataSuccess(
            symptoms: state.symptoms,
            selectedSymptom: state.selectedSymptom,
            secondarySymptoms: state.secondarySymptoms,
            symptomPrograms: symptomContent.results.symptomPrograms
                .map((program) => program.toProgram())
                .toList(),
            symptomArticles: symptomContent.results.symptomArticles
                .map((ar) => ar.toArticleUio())
                .toList(),
            userSymptoms: state.userSymptoms,
          ),
        );
      } catch (e) {
        emit(SymptomError(
          errorMessage: e.toString(),
          symptoms: state.symptoms,
          selectedSymptom: state.selectedSymptom,
          secondarySymptoms: state.secondarySymptoms,
          symptomPrograms: state.symptomPrograms,
          symptomArticles: state.symptomArticles,
          userSymptoms: state.userSymptoms,
        ));
      }
    });

    on<FetchTodaysActionPrograms>((event, emit) async {
      try {
        emit(
          SymptomDataLoading(
            symptoms: state.symptoms,
            selectedSymptom: state.selectedSymptom,
            secondarySymptoms: state.secondarySymptoms,
            symptomPrograms: state.symptomPrograms,
            symptomArticles: state.symptomArticles,
            userSymptoms: state.userSymptoms,
          ),
        );
        SymptomRepository repository = SymptomLocator().get();
        final programs = await repository.getTodayActionsProgram();
        emit(
          SymptomDataSuccess(
            symptoms: state.symptoms,
            selectedSymptom: state.selectedSymptom,
            secondarySymptoms: state.secondarySymptoms,
            symptomPrograms:
                programs.map((program) => program.toProgram()).toList(),
            symptomArticles: state.symptomArticles,
            userSymptoms: state.userSymptoms,
          ),
        );
      } catch (e) {
        emit(SymptomError(
          errorMessage: e.toString(),
          symptoms: state.symptoms,
          selectedSymptom: state.selectedSymptom,
          secondarySymptoms: state.secondarySymptoms,
          symptomPrograms: state.symptomPrograms,
          symptomArticles: state.symptomArticles,
          userSymptoms: state.userSymptoms,
        ));
      }
    });

    on<FetchUserSymptoms>((event, emit) async {
      try {
        emit(
          UserSymptomsLoading(
            symptoms: state.symptoms,
            selectedSymptom: state.selectedSymptom,
            secondarySymptoms: state.secondarySymptoms,
            symptomPrograms: state.symptomPrograms,
            symptomArticles: state.symptomArticles,
            userSymptoms: state.userSymptoms,
          ),
        );
        SymptomRepository repository = SymptomLocator().get();
        final symptoms = await repository.fetchUserSymptoms();
        emit(
          SymptomDataSuccess(
            symptoms: state.symptoms,
            selectedSymptom: state.selectedSymptom,
            secondarySymptoms: state.secondarySymptoms,
            symptomPrograms: state.symptomPrograms,
            symptomArticles: state.symptomArticles,
            userSymptoms: symptoms.map((sym) => sym.toSymptom()).toList(),
          ),
        );
      } catch (e) {
        emit(SymptomError(
          errorMessage: e.toString(),
          symptoms: state.symptoms,
          selectedSymptom: state.selectedSymptom,
          secondarySymptoms: state.secondarySymptoms,
          symptomPrograms: state.symptomPrograms,
          symptomArticles: state.symptomArticles,
          userSymptoms: state.userSymptoms,
        ));
      }
    });

    on<ChangePrimarySymptom>((event, emit) async {
      try {
        emit(
          UpdateSymptomsLoading(
            symptoms: state.symptoms,
            selectedSymptom: state.selectedSymptom,
            secondarySymptoms: state.secondarySymptoms,
            symptomPrograms: state.symptomPrograms,
            symptomArticles: state.symptomArticles,
            userSymptoms: state.userSymptoms,
          ),
        );
        SymptomRepository repository = SymptomLocator().get();
        await repository.addUserSymptom(UserSymptomRequestModel(
          symptomId: event.symptom.symptomId,
          type: "primary",
        ));
        emit(
          UpdateSymptomsSuccess(
            symptoms: state.symptoms,
            selectedSymptom: state.selectedSymptom,
            secondarySymptoms: state.secondarySymptoms,
            symptomPrograms: state.symptomPrograms,
            symptomArticles: state.symptomArticles,
            userSymptoms: state.userSymptoms,
          ),
        );
      } catch (e) {
        emit(SymptomError(
          errorMessage: e.toString(),
          symptoms: state.symptoms,
          selectedSymptom: state.selectedSymptom,
          secondarySymptoms: state.secondarySymptoms,
          symptomPrograms: state.symptomPrograms,
          symptomArticles: state.symptomArticles,
          userSymptoms: state.userSymptoms,
        ));
      }
    });

    on<SetTodaysActionsProgram>((event, emit) async {
      try {
        emit(
          UpdateSymptomsLoading(
            symptoms: state.symptoms,
            selectedSymptom: state.selectedSymptom,
            secondarySymptoms: state.secondarySymptoms,
            symptomPrograms: state.symptomPrograms,
            symptomArticles: state.symptomArticles,
            userSymptoms: state.userSymptoms,
          ),
        );
        SetTodaysActionsProgramUseCase useCase = SymptomLocator().get();
        await useCase.execute(event.program);
        emit(
          UpdateSymptomsSuccess(
            symptoms: state.symptoms,
            selectedSymptom: state.selectedSymptom,
            secondarySymptoms: state.secondarySymptoms,
            symptomPrograms: state.symptomPrograms,
            symptomArticles: state.symptomArticles,
            userSymptoms: state.userSymptoms,
          ),
        );
      } catch (e) {
        emit(SymptomError(
          errorMessage: e.toString(),
          symptoms: state.symptoms,
          selectedSymptom: state.selectedSymptom,
          secondarySymptoms: state.secondarySymptoms,
          symptomPrograms: state.symptomPrograms,
          symptomArticles: state.symptomArticles,
          userSymptoms: state.userSymptoms,
        ));
      }
    });

    on<AddSecondarySymptoms>((event, emit) async {
      try {
        emit(
          UpdateSymptomsLoading(
            symptoms: state.symptoms,
            selectedSymptom: state.selectedSymptom,
            secondarySymptoms: state.secondarySymptoms,
            symptomPrograms: state.symptomPrograms,
            symptomArticles: state.symptomArticles,
            userSymptoms: state.userSymptoms,
          ),
        );
        SymptomRepository repository = SymptomLocator().get();
        for (final symp in event.symptoms) {
          await repository.addUserSymptom(UserSymptomRequestModel(
            symptomId: symp.symptomId,
            type: "secondary",
          ));
        }

        emit(
          UpdateSymptomsSuccess(
            symptoms: state.symptoms,
            selectedSymptom: state.selectedSymptom,
            secondarySymptoms: state.secondarySymptoms,
            symptomPrograms: state.symptomPrograms,
            symptomArticles: state.symptomArticles,
            userSymptoms: state.userSymptoms,
          ),
        );
      } catch (e) {
        emit(SymptomError(
          errorMessage: e.toString(),
          symptoms: state.symptoms,
          selectedSymptom: state.selectedSymptom,
          secondarySymptoms: state.secondarySymptoms,
          symptomPrograms: state.symptomPrograms,
          symptomArticles: state.symptomArticles,
          userSymptoms: state.userSymptoms,
        ));
      }
    });
  }
}
