import 'package:get_it/get_it.dart';

import '../../../../utils/locator/abstract_locator.dart';
import '../../../../utils/network/dio_builder.dart';
import '../repository/on_boarding_repository.dart';
import '../service/onboarding_service.dart';

class OnBoardingLocator extends AbstractLocator {
  static final OnBoardingLocator _onBoardingLocator =
      OnBoardingLocator._internal();

  factory OnBoardingLocator() {
    return _onBoardingLocator;
  }

  OnBoardingLocator._internal();

  @override
  void setUp(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<OnBoardingService>(
        () => OnBoardingService(DioBuilder.createDio()));
    serviceLocator.registerLazySingleton<OnBoardingRepository>(
        () => OnBoardingRepositoryImpl());
  }
}
