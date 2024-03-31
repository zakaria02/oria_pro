import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/common/email_verification/business/locator/email_verification_locator.dart';
import 'package:oria_pro/common/email_verification/business/repository/email_verification_repository.dart';

part 'email_verification_event.dart';
part 'email_verification_state.dart';

class EmailVerificationBloc
    extends Bloc<EmailVerificationEvent, EmailVerificationState> {
  EmailVerificationRepository repository = EmailVerificationLocator().get();

  EmailVerificationBloc() : super(EmailVerificationInitial()) {
    on<SendVerificationEmail>((event, emit) async {
      try {
        emit(SendVerificationEmailLoading());
        await repository.sendVerificationEmail();
        emit(SendVerificationEmailSuccess());
      } catch (e) {
        emit(EmailVerificationError(errorMessage: e.toString()));
      }
    });
    on<VerifyEmail>((event, emit) async {
      try {
        emit(VerifyEmailLoading());
        await repository.verifyEmail(event.token);
        emit(VerifyEmailSuccess());
      } catch (e) {
        emit(VerifyEmailFailed());
      }
    });
  }
}
