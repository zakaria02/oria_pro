import 'package:get_it/get_it.dart';
import 'package:oria_pro/common/email_verification/business/repository/email_verification_repository.dart';
import 'package:oria_pro/common/email_verification/business/service/email_verification_service.dart';

import '../../../../utils/locator/abstract_locator.dart';
import '../../../../utils/network/dio_builder.dart';

class EmailVerificationLocator extends AbstractLocator {
  static final EmailVerificationLocator _emailVerificationLocator =
      EmailVerificationLocator._internal();

  factory EmailVerificationLocator() {
    return _emailVerificationLocator;
  }

  EmailVerificationLocator._internal();

  @override
  void setUp(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<EmailVerificationService>(
        () => EmailVerificationService(DioBuilder.createDio()));
    serviceLocator.registerLazySingleton<EmailVerificationRepository>(
        () => EmailVerificationRepositoryImpl());
  }
}
