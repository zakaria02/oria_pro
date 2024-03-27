part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class GetUserLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  const AuthSuccess();
}

final class AuthError extends AuthState {
  final String errorMessage;
  const AuthError({required this.errorMessage});
}
