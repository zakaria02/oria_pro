part of 'email_verification_bloc.dart';

sealed class EmailVerificationEvent extends Equatable {
  const EmailVerificationEvent();

  @override
  List<Object> get props => [];
}

final class SendVerificationEmail extends EmailVerificationEvent {}

final class VerifyEmail extends EmailVerificationEvent {
  final String pin;

  const VerifyEmail({required this.pin});
}
