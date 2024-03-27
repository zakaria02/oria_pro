part of 'email_verification_bloc.dart';

sealed class EmailVerificationState extends Equatable {
  const EmailVerificationState();

  @override
  List<Object> get props => [];
}

final class EmailVerificationInitial extends EmailVerificationState {}

final class SendVerificationEmailLoading extends EmailVerificationState {}

final class SendVerificationEmailSuccess extends EmailVerificationState {}

final class VerifyEmailLoading extends EmailVerificationState {}

final class VerifyEmailSuccess extends EmailVerificationState {}

final class VerifyEmailFailed extends EmailVerificationState {}

final class EmailVerificationError extends EmailVerificationState {
  final String errorMessage;

  const EmailVerificationError({
    required this.errorMessage,
  });
}
