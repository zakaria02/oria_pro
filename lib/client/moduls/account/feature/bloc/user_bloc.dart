import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/account/feature/use_case/update_share_medical_info.dart';
import 'package:oria_pro/client/moduls/account/feature/use_case/update_user_info_usecase.dart';
import 'package:oria_pro/common/auth/business/email_password/locator/email_password_locator.dart';
import 'package:oria_pro/common/auth/business/email_password/model/user_model.dart';
import 'package:oria_pro/common/auth/business/local_data_source/auth_local_data_source.dart';
import 'package:oria_pro/common/entity/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitial()) {
    on<FetchAccount>((event, emit) async {
      try {
        final AuthLocalDataSource authLocalDataSource =
            EmailPasswordAuthLocator().get();
        final user = await authLocalDataSource.getUser();
        emit(FetchAccountSuccess(currenUser: user?.toUser()));
      } catch (e) {
        UserError(currenUser: state.currenUser, errorMessage: e.toString());
      }
    });
    on<UpdateUser>((event, emit) async {
      final UpdateMyInfoUseCase usecase = EmailPasswordAuthLocator().get();
      try {
        emit(UpdateUserLoading(currenUser: state.currenUser));
        final updated = await usecase.execute(
          state.currenUser!,
          event.email,
          event.name,
          event.birthDay,
        );
        if (updated) {
          add(FetchAccount());
        } else {
          emit(UserError(
              currenUser: state.currenUser,
              errorMessage: "Error while updating current user"));
        }
      } catch (e) {
        UserError(currenUser: state.currenUser, errorMessage: e.toString());
      }
    });

    on<UpdateMedicalInfoSharing>((event, emit) async {
      final UpdateShareMedicalInfoUseCase usecase =
          EmailPasswordAuthLocator().get();
      final AuthLocalDataSource authLocalDataSource =
          EmailPasswordAuthLocator().get();
      try {
        emit(UpdateUserLoading(currenUser: state.currenUser));
        final updated = await usecase.execute(
          event.shareMedicalInfo,
        );
        if (updated) {
          final user = await authLocalDataSource.getUser();
          final updatedUser =
              user!.copyWith(shareMedicalInfo: event.shareMedicalInfo);
          await authLocalDataSource.saveUser(updatedUser);
          emit(UpdateUserSuccess(currenUser: updatedUser.toUser()));
        } else {
          emit(UserError(
              currenUser: state.currenUser,
              errorMessage: "Error while updating current user"));
        }
      } catch (e) {
        UserError(currenUser: state.currenUser, errorMessage: e.toString());
      }
    });
  }
}
