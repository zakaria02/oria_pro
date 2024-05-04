import 'package:get_it/get_it.dart';
import '../../../../../../utils/network/dio_builder.dart';
import '../../../../../utils/locator/abstract_locator.dart';
import '../../feature/usecase/fetch_activities_use_case.dart';
import '../../feature/usecase/get_activities_use_case.dart';
import '../repository/symptom_tracker_repository.dart';
import '../service/symptom_tracker_local_ds.dart';
import '../service/symptom_tracker_service.dart';

class SymptomTrackerLocator extends AbstractLocator {
  static final SymptomTrackerLocator _symptomTrackerLocator =
      SymptomTrackerLocator._internal();

  factory SymptomTrackerLocator() {
    return _symptomTrackerLocator;
  }

  SymptomTrackerLocator._internal();

  @override
  void setUp(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<SymptomTrackerService>(
        () => SymptomTrackerService(DioBuilder.createDio()));
    serviceLocator.registerLazySingleton<SymptomTrackerRepository>(
        () => SymptomTrackerRepositoryImpl());
    serviceLocator.registerLazySingleton<FetchActivityUseCase>(
        () => FetchActivityUseCase());
    serviceLocator.registerLazySingleton<SymptomTrackerDataSource>(
        () => SymptomTrackerDataSource());
    serviceLocator
        .registerLazySingleton<GetActivityUseCase>(() => GetActivityUseCase());
  }
}
