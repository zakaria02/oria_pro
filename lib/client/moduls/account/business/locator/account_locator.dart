import 'package:get_it/get_it.dart';
import 'package:oria_pro/client/moduls/account/feature/use_case/update_user_info_usecase.dart';
import '../../../../../utils/locator/abstract_locator.dart';

class AccountLocator extends AbstractLocator {
  static final AccountLocator _accountLocator = AccountLocator._internal();

  factory AccountLocator() {
    return _accountLocator;
  }

  AccountLocator._internal();

  @override
  void setUp(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<UpdateMyInfoUseCase>(
        () => UpdateMyInfoUseCase());
  }
}
