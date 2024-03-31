import 'package:oria_pro/common/email_verification/business/locator/email_verification_locator.dart';
import 'package:oria_pro/common/email_verification/business/service/email_verification_service.dart';

abstract class EmailVerificationRepository {
  Future<void> sendVerificationEmail();

  Future<void> verifyEmail(String token);
}

class EmailVerificationRepositoryImpl extends EmailVerificationRepository {
  EmailVerificationService service = EmailVerificationLocator().get();

  @override
  Future<void> sendVerificationEmail() {
    return service.sendVerificationEmail();
  }

  @override
  Future<void> verifyEmail(String token) {
    return service.verifyEmail(token);
  }
}
