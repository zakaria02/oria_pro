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
    on<FetchUserInfo>((event, emit) async {
      try {
        AuthLocalDataSource authLocalDataSource =
            EmailPasswordAuthLocator().get();
        emit(FetchUserInfoLoading(
          currentUser: state.currentUser,
          userSymptoms: state.userSymptoms,
          selectedSymptom: state.selectedSymptom,
          actions: state.actions,
        ));
        final user = await authLocalDataSource.getUser();
        emit(FetchUserInfoSuccess(
          currentUser: user!.toUser(),
          userSymptoms: state.userSymptoms,
          selectedSymptom: state.selectedSymptom,
          actions: state.actions,
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

    on<FetchTodaysActions>((event, emit) async {
      try {
        GetDailyActionsUseCase getDailyActionsUseCase = HomeLocator().get();
        emit(FetchTodaysActionsLoading(
          currentUser: state.currentUser,
          userSymptoms: state.userSymptoms,
          selectedSymptom: state.selectedSymptom,
          actions: state.actions,
        ));
        final actions = await getDailyActionsUseCase.execute();
        emit(FetchTodaysActionsSuccess(
          currentUser: state.currentUser,
          userSymptoms: state.userSymptoms,
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

    on<FetchUserCurrentSymptoms>((event, emit) async {
      try {
        GetUserSymptomsUsecase getUserSymptomsUsecase = SymptomLocator().get();
        emit(FetchUserCurrentSymptomsLoading(
          currentUser: state.currentUser,
          userSymptoms: state.userSymptoms,
          selectedSymptom: state.selectedSymptom,
          actions: state.actions,
        ));
        final symptoms = await getUserSymptomsUsecase.execute();

        emit(FetchUserCurrentSymptomsSuccess(
          currentUser: state.currentUser,
          userSymptoms: symptoms,
          selectedSymptom: state.selectedSymptom,
          actions: state.actions,
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
      add(FetchTodaysActions());
    });
  }
}
