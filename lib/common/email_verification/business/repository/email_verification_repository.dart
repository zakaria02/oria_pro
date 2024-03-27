import 'package:oria_pro/common/email_verification/business/locator/email_verification_locator.dart';
import 'package:oria_pro/common/email_verification/business/service/email_verification_service.dart';

import '../model/verify_email_request_model.dart';

abstract class EmailVerificationRepository {
  Future<void> sendVerificationEmail();

  Future<void> verifyEmail(VerifyEmailRequestModel request);
}

class EmailVerificationRepositoryImpl extends EmailVerificationRepository {
  EmailVerificationService service = EmailVerificationLocator().get();

  @override
  Future<void> sendVerificationEmail() {
    return service.sendVerificationEmail();
  }

  @override
  Future<void> verifyEmail(VerifyEmailRequestModel request) {
    return service.verifyEmail(request);
  }
}
