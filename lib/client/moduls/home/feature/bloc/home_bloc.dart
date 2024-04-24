import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/home/business/locator/home_locator.dart';
import 'package:oria_pro/client/moduls/home/business/repository/home_repository.dart';
import 'package:oria_pro/client/moduls/home/feature/entity/daily_actions.dart';
import 'package:oria_pro/client/moduls/home/feature/usecase/get_daily_actions_use_case.dart';
import 'package:oria_pro/common/auth/business/email_password/locator/email_password_locator.dart';
import 'package:oria_pro/common/auth/business/email_password/model/user_model.dart';
import 'package:oria_pro/common/auth/business/local_data_source/auth_local_data_source.dart';
import 'package:oria_pro/common/symptoms/business/locator/symptom_locator.dart';
import 'package:oria_pro/common/symptoms/feature/entity/symptom.dart';
import 'package:oria_pro/common/symptoms/feature/usecase/get_user_symptoms.dart';

import '../../../../../common/entity/user.dart';
import '../../business/model/finish_action_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetHomeData>((event, emit) async {
      try {
        AuthLocalDataSource authLocalDataSource =
            EmailPasswordAuthLocator().get();
        GetUserSymptomsUsecase getUserSymptomsUsecase = SymptomLocator().get();
        GetDailyActionsUseCase getDailyActionsUseCase = HomeLocator().get();
        emit(GetHomeDataLoading(
          currentUser: state.currentUser,
          userSymptoms: state.userSymptoms,
          selectedSymptom: state.selectedSymptom,
          actions: state.actions,
        ));
        final user = await authLocalDataSource.getUser();
        final symptoms = await getUserSymptomsUsecase.execute();
        final actions = await getDailyActionsUseCase.execute();
        emit(GetHomeDataSuccess(
          currentUser: user!.toUser(),
          userSymptoms: symptoms,
          selectedSymptom: state.selectedSymptom,
          actions: actions,
        ));
      } catch (e) {
        emit(HomeError(
          errorMessage: e.toString(),
          currentUser: state.currentUser,
          userSymptoms: state.userSymptoms,
          selectedSymptom: state.selectedSymptom,
          actions: state.actions,
        ));
      }
    });
    on<SelectSymptom>((event, emit) {
      emit(
        SelectedSymptom(
          currentUser: state.currentUser,
          userSymptoms: state.userSymptoms,
          selectedSymptom: event.symptom,
          actions: state.actions,
        ),
      );
    });

    on<FinishAnAction>((event, emit) async {
      HomeRepository repository = HomeLocator().get();
      await repository.finishAnAction(
        FinishActionModel(
            completedProgramSection: event.completedProgramSection,
            readArticle: event.readArticle,
            loggedSymptomSeverity: event.loggedSymptomSeverity),
      );
      add(GetHomeData());
    });
  }
}
