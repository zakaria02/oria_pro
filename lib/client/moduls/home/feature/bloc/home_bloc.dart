import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/common/auth/business/email_password/locator/email_password_locator.dart';
import 'package:oria_pro/common/auth/business/email_password/model/user_model.dart';
import 'package:oria_pro/common/auth/business/local_data_source/auth_local_data_source.dart';
import 'package:oria_pro/common/symptoms/business/locator/symptom_locator.dart';
import 'package:oria_pro/common/symptoms/feature/entity/symptom.dart';
import 'package:oria_pro/common/symptoms/feature/usecase/get_user_symptoms.dart';

import '../../../../../common/entity/user.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetHomeData>((event, emit) async {
      try {
        AuthLocalDataSource authLocalDataSource =
            EmailPasswordAuthLocator().get();
        GetUserSymptomsUsecase getUserSymptomsUsecase = SymptomLocator().get();
        emit(GetHomeDataLoading(
          currentUser: state.currentUser,
          userSymptoms: state.userSymptoms,
          selectedSymptom: state.selectedSymptom,
        ));
        final user = await authLocalDataSource.getUser();
        final symptoms = await getUserSymptomsUsecase.execute();
        emit(GetHomeDataSuccess(
          currentUser: user!.toUser(),
          userSymptoms: symptoms,
          selectedSymptom: state.selectedSymptom,
        ));
      } catch (e) {
        emit(HomeError(
          errorMessage: e.toString(),
          currentUser: state.currentUser,
          userSymptoms: state.userSymptoms,
          selectedSymptom: state.selectedSymptom,
        ));
      }
    });
    on<SelectSymptom>((event, emit) {
      emit(
        SelectedSymptom(
          currentUser: state.currentUser,
          userSymptoms: state.userSymptoms,
          selectedSymptom: event.symptom,
        ),
      );
    });
  }
}
