import 'package:get_it/get_it.dart';
import '../../../../../../utils/network/dio_builder.dart';
import '../../../../../utils/locator/abstract_locator.dart';
import '../repository/expert_repository.dart';
import '../service/expert_service.dart';

class ExpertLocator extends AbstractLocator {
  static final ExpertLocator _expertLocator = ExpertLocator._internal();

  factory ExpertLocator() {
    return _expertLocator;
  }

  ExpertLocator._internal();

  @override
  void setUp(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<ExpertService>(
        () => ExpertService(DioBuilder.createDio()));
    serviceLocator
        .registerLazySingleton<ExpertRepository>(() => ExpertRepositoryImpl());
  }
}
