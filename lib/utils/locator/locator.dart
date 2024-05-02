import 'package:get_it/get_it.dart';
import 'package:oria_pro/client/moduls/explore/business/di/explore_locator.dart';
import 'package:oria_pro/common/email_verification/business/locator/email_verification_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../client/moduls/account/business/locator/account_locator.dart';
import '../../client/moduls/expert/business/locator/expert_locator.dart';
import '../../client/moduls/home/business/locator/home_locator.dart';
import '../../client/moduls/tracker/business/locator/tracker_locator.dart';
import '../../common/onboarding/business/locator/onboarding_lcoator.dart';
import '../router/router.dart';
import 'abstract_locator.dart';

/// The main [GetIt] locator where we set up all the app locators
class AppLocator extends AbstractLocator {
  static final AppLocator _appLocator = AppLocator._internal();

  factory AppLocator() {
    return _appLocator;
  }

  AppLocator._internal() {
    setUp(serviceLocator);
  }

  @override
  void setUp(GetIt serviceLocator) {
    // Add your locators here
    serviceLocator.registerLazySingleton<AppRouter>(() => AppRouter());
    serviceLocator.registerLazySingletonAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());
    OnBoardingLocator().setUp(serviceLocator);
    ExploreLocator().setUp(serviceLocator);
    EmailVerificationLocator().setUp(serviceLocator);
    ExpertLocator().setUp(serviceLocator);
    AccountLocator().setUp(serviceLocator);
    HomeLocator().setUp(serviceLocator);
    SymptomTrackerLocator().setUp(serviceLocator);
  }
}
