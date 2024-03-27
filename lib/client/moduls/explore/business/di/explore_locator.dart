import 'package:get_it/get_it.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/use_case/finish_section_use_case.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/use_case/start_section_use_case.dart';
import '../../../../../../utils/network/dio_builder.dart';
import '../../../../../utils/locator/abstract_locator.dart';
import '../../feature/learning/use_case/update_favorite_use_case.dart';
import '../../feature/use_case/fetch_learning_content_use_case.dart';
import '../repository/explore_repository.dart';
import '../service/explore_service.dart';

class ExploreLocator extends AbstractLocator {
  static final ExploreLocator _exploreLocator = ExploreLocator._internal();

  factory ExploreLocator() {
    return _exploreLocator;
  }

  ExploreLocator._internal();

  @override
  void setUp(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<ExploreService>(
        () => ExploreService(DioBuilder.createDio()));
    serviceLocator.registerLazySingleton<ExploreRepository>(
        () => ExploreRepositoryImpl());
    serviceLocator.registerLazySingleton<FetchLearningContentUseCase>(
        () => FetchLearningContentUseCase());
    serviceLocator.registerLazySingleton<UpdateArticleFavoriteUseCase>(
        () => UpdateArticleFavoriteUseCase());
    serviceLocator.registerLazySingleton<StartSectionUseCase>(
        () => StartSectionUseCase());
    serviceLocator.registerLazySingleton<FinishSectionUseCase>(
        () => FinishSectionUseCase());
  }
}
