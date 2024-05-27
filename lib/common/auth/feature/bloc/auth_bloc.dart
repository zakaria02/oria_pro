import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/common/auth/business/other_methods/repository/other_methods_repository.dart';

import '../../business/email_password/locator/email_password_locator.dart';
import '../usecase/login_use_case.dart';
import '../usecase/signup_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<Login>((event, emit) async {
      LoginUseCase usecase = EmailPasswordAuthLocator().get();

      emit(AuthLoading());
      try {
        await usecase.execute(event.email, event.password);
        emit(const AuthSuccess());
      } catch (e) {
        emit(AuthError(errorMessage: e.toString()));
      }
    });

    on<GoogleLogin>((event, emit) async {
      OtherMethodsRepository reposutory = EmailPasswordAuthLocator().get();

      emit(AuthLoading());
      try {
        await reposutory.signInWithGoogle();
        emit(const AuthSuccess());
      } catch (e) {
        emit(AuthError(errorMessage: e.toString()));
      }
    });

    on<SignUp>((event, emit) async {
      SignupUseCase usecase = EmailPasswordAuthLocator().get();

      emit(AuthLoading());
      try {
        await usecase.execute(event.email, event.password);
        emit(const AuthSuccess());
      } catch (e) {
        emit(AuthError(errorMessage: e.toString()));
      }
    });
  }
}
