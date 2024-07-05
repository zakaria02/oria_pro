import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/utils/bloc/bloc_observer.dart';
import 'package:oria_pro/utils/locator/locator.dart';
import 'package:oria_pro/utils/notifications/notifications.dart';
import 'utils/hive/hive_init.dart';
import 'utils/local_storage/app_path_provider.dart';
import 'utils/router/router.dart';
import 'utils/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // This will let us observe any change that is happening in the Bloc
  Bloc.observer = AppBlocObserver();
  // Initialize [GetIt] locator
  AppLocator();
  // Init path provider for cache
  await AppPathProvider.initPath();
  // Initialize hive
  initHive();
  // Init notifications
  initNotification();
  // Block Oriontation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // Launch App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppLocator().get<AppRouter>().config(),
      theme: AppTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
