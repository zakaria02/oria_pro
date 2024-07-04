import 'package:get_it/get_it.dart';
import '../../../../../../utils/network/dio_builder.dart';
import '../../../../../utils/locator/abstract_locator.dart';
import '../repository/notifications_repository.dart';
import '../service/notifications_service.dart';

class NotificationsLocator extends AbstractLocator {
  static final NotificationsLocator _notificationsLocator =
      NotificationsLocator._internal();

  factory NotificationsLocator() {
    return _notificationsLocator;
  }

  NotificationsLocator._internal();

  @override
  void setUp(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<NotificationsService>(
        () => NotificationsService(DioBuilder.createDio()));
    serviceLocator.registerLazySingleton<NotificationsRepository>(
        () => NotificationsRepositoryImpl());
  }
}
