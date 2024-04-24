import 'package:get_it/get_it.dart';
import 'package:oria_pro/common/auth/feature/usecase/get_user_steps_use_case.dart';

import '../../../../../utils/locator/abstract_locator.dart';
import '../../../../../utils/network/dio_builder.dart';
import '../../../feature/usecase/login_use_case.dart';
import '../../../feature/usecase/signup_use_case.dart';
import '../../local_data_source/auth_local_data_source.dart';
import '../repository/email_password_repository.dart';
import '../service/email_password_service.dart';

/// The main [GetIt] locator where we set up all the app locators
class EmailPasswordAuthLocator extends AbstractLocator {
  static final EmailPasswordAuthLocator _emailPasswordAuthLocator =
      EmailPasswordAuthLocator._internal();

  factory EmailPasswordAuthLocator() {
    return _emailPasswordAuthLocator;
  }

  EmailPasswordAuthLocator._internal() {
    setUp(serviceLocator);
  }

  @override
  void setUp(GetIt serviceLocator) {
    // Add your locators here
    serviceLocator.registerLazySingleton<EmailPasswordService>(
        () => EmailPasswordService(DioBuilder.createDio()));
    serviceLocator.registerLazySingleton<EmailPasswordRepository>(
        () => EmailPasswordRepositoryImpl());
    serviceLocator.registerLazySingleton<LoginUseCase>(() => LoginUseCase());
    serviceLocator.registerLazySingleton<SignupUseCase>(() => SignupUseCase());
    serviceLocator.registerLazySingleton<GetUserStepsUseCase>(
        () => GetUserStepsUseCase());
    serviceLocator.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSource());
  }
}
