import 'package:get_it/get_it.dart';

import '../../../../../utils/locator/abstract_locator.dart';
import '../../../../../utils/network/dio_builder.dart';
import '../repository/other_methods_repository.dart';
import '../service/other_methods_service.dart';

/// The main [GetIt] locator where we set up all the app locators
class OtherMethodsLocator extends AbstractLocator {
  static final OtherMethodsLocator _otherMethodsLocator =
      OtherMethodsLocator._internal();

  factory OtherMethodsLocator() {
    return _otherMethodsLocator;
  }

  OtherMethodsLocator._internal() {
    setUp(serviceLocator);
  }

  @override
  void setUp(GetIt serviceLocator) {
    // Add your locators here
    if (!serviceLocator.isRegistered<OtherMethodsService>()) {
      serviceLocator.registerLazySingleton<OtherMethodsService>(
          () => OtherMethodsService(DioBuilder.createDio()));
    }
    if (!serviceLocator.isRegistered<OtherMethodsRepository>()) {
      serviceLocator.registerLazySingleton<OtherMethodsRepository>(
          () => OtherMethodsRepositoryImpl());
    }
  }
}
