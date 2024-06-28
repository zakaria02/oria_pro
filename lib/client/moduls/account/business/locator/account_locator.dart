import 'package:get_it/get_it.dart';
import 'package:oria_pro/client/moduls/account/business/repository/medical_info_repository.dart';
import 'package:oria_pro/client/moduls/account/business/service/medical_info_service.dart';
import 'package:oria_pro/client/moduls/account/feature/use_case/set_player_id_use_case.dart';
import 'package:oria_pro/client/moduls/account/feature/use_case/update_user_info_usecase.dart';
import 'package:oria_pro/utils/network/dio_builder.dart';
import '../../../../../utils/locator/abstract_locator.dart';
import '../../feature/use_case/fetch_favourite_use_case.dart';
import '../../feature/use_case/update_share_medical_info.dart';

class AccountLocator extends AbstractLocator {
  static final AccountLocator _accountLocator = AccountLocator._internal();

  factory AccountLocator() {
    return _accountLocator;
  }

  AccountLocator._internal();

  @override
  void setUp(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<MedicalInfoService>(
        () => MedicalInfoService(DioBuilder.createDio()));
    serviceLocator.registerLazySingleton<MedicalInfoRepository>(
        () => MedicalInfoRepositoryImpl());
    serviceLocator.registerLazySingleton<UpdateMyInfoUseCase>(
        () => UpdateMyInfoUseCase());
    serviceLocator.registerLazySingleton<UpdateShareMedicalInfoUseCase>(
        () => UpdateShareMedicalInfoUseCase());
    serviceLocator.registerLazySingleton<FetchFavouriteUseCase>(
        () => FetchFavouriteUseCase());
    serviceLocator
        .registerLazySingleton<SetPlayerIdUseCase>(() => SetPlayerIdUseCase());
  }
}
