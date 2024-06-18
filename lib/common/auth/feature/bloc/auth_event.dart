part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class SignUp extends AuthEvent {
  final String email;
  final String password;

  const SignUp({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

final class Login extends AuthEvent {
  final String email;
  final String password;

  const Login({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

final class GoogleLogin extends AuthEvent {}

final class FacebookLogin extends AuthEvent {}
