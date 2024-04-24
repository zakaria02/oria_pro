import 'package:get_it/get_it.dart';
import '../../../../../../utils/network/dio_builder.dart';
import '../../../../../utils/locator/abstract_locator.dart';
import '../../feature/usecase/get_daily_actions_use_case.dart';
import '../repository/home_repository.dart';
import '../service/home_service.dart';

class HomeLocator extends AbstractLocator {
  static final HomeLocator _homeLocator = HomeLocator._internal();

  factory HomeLocator() {
    return _homeLocator;
  }

  HomeLocator._internal();

  @override
  void setUp(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<HomeService>(
        () => HomeService(DioBuilder.createDio()));
    serviceLocator
        .registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
    serviceLocator.registerLazySingleton<GetDailyActionsUseCase>(
        () => GetDailyActionsUseCase());
  }
}
