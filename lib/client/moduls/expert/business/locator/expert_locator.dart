import 'package:get_it/get_it.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/usecase/create_appointment_usecase.dart';
import '../../../../../../utils/network/dio_builder.dart';
import '../../../../../utils/locator/abstract_locator.dart';
import '../../feature/pages/appointments/usecase/fetch_all_appointments.dart';
import '../../feature/pages/appointments/usecase/get_day_availabilities_use_case.dart';
import '../../feature/use_case/update_expert_favorite_use_case.dart';
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
    serviceLocator.registerLazySingleton<GetDayAvailabilitiesUseCase>(
        () => GetDayAvailabilitiesUseCase());
    serviceLocator.registerLazySingleton<CreateAppointmentUsecase>(
        () => CreateAppointmentUsecase());
    serviceLocator.registerLazySingleton<FetchAllAppointmentsUsecase>(
        () => FetchAllAppointmentsUsecase());
    serviceLocator.registerLazySingleton<UpdateExpertFavoriteUseCase>(
        () => UpdateExpertFavoriteUseCase());
  }
}
