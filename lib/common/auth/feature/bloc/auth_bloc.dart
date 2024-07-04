import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/common/auth/business/email_password/model/forgot_password_request.dart';
import 'package:oria_pro/common/auth/business/email_password/model/reset_password_request.dart';
import 'package:oria_pro/common/auth/business/email_password/repository/email_password_repository.dart';
import '../../business/email_password/locator/email_password_locator.dart';
import '../../business/other_methods/locator/other_methods_locator.dart';
import '../../business/other_methods/repository/other_methods_repository.dart';
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
      OtherMethodsRepository repository = OtherMethodsLocator().get();
      emit(AuthLoading());
      try {
        await repository.signInWithGoogle();
        emit(const AuthSuccess());
      } catch (e) {
        emit(AuthError(errorMessage: e.toString()));
      }
    });

    on<FacebookLogin>((event, emit) async {
      OtherMethodsRepository repository = OtherMethodsLocator().get();
      emit(AuthLoading());
      try {
        await repository.signInWithFacebook();
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

    on<ForgotPassword>((event, emit) async {
      EmailPasswordRepository repository = EmailPasswordAuthLocator().get();

      emit(ForgotPassworLoading());
      try {
        await repository
            .forgotPassword(ForgotPasswordRequest(email: event.email));
        emit(const ForgotPassworSuccess());
      } catch (e) {
        emit(AuthError(errorMessage: e.toString()));
      }
    });

    on<ResetPassword>((event, emit) async {
      EmailPasswordRepository repository = EmailPasswordAuthLocator().get();

      emit(ResetPasswordLoading());
      try {
        await repository.resetPassword(
          ResetPasswordRequest(password: event.password),
          event.token,
        );
        emit(const ResetPasswordSuccess());
      } catch (e) {
        emit(AuthError(errorMessage: e.toString()));
      }
    });
  }
}
