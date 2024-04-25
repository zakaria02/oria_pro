import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/explore/business/model/explore_symptom_article_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/symptom_programs_model.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/learning_content.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/entity/program.dart';

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
        ));
      }
    });
  }
}
