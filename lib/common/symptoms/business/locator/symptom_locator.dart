import 'package:get_it/get_it.dart';
import 'package:oria_pro/common/symptoms/feature/usecase/get_user_symptoms.dart';

import '../../../../../utils/locator/abstract_locator.dart';
import '../../../../../utils/network/dio_builder.dart';
import '../../feature/usecase/add_primay_symptom_use_case.dart';
import '../../feature/usecase/add_secondary_symptom.dart';
import '../../feature/usecase/set_todays_actions_program_use_case.dart';
import '../repository/symptom_repository.dart';
import '../service/symptom_service.dart';

/// The main [GetIt] locator where we set up all the app locators
class SymptomLocator extends AbstractLocator {
  static final SymptomLocator _symptomLocator = SymptomLocator._internal();

  factory SymptomLocator() {
    return _symptomLocator;
  }

  SymptomLocator._internal() {
    setUp(serviceLocator);
  }

  @override
  void setUp(GetIt serviceLocator) {
    // Add your locators here
    serviceLocator.registerLazySingleton<SymptomService>(
        () => SymptomService(DioBuilder.createDio()));
    serviceLocator.registerLazySingleton<SymptomRepository>(
        () => SymptomRepositoryImpl());
    serviceLocator.registerLazySingleton<AddPrimarySymptomUsecase>(
        () => AddPrimarySymptomUsecase());
    serviceLocator.registerLazySingleton<AddSecondarySymptomUsecase>(
        () => AddSecondarySymptomUsecase());
    serviceLocator.registerLazySingleton<GetUserSymptomsUsecase>(
        () => GetUserSymptomsUsecase());
    serviceLocator.registerLazySingleton<SetTodaysActionsProgramUseCase>(
        () => SetTodaysActionsProgramUseCase());
  }
}
