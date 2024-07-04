import 'package:oria_pro/client/moduls/home/business/locator/notification_locator.dart';
import 'package:oria_pro/client/moduls/home/business/service/notifications_service.dart';

import '../model/notification_response_model.dart';

abstract class NotificationsRepository {
  Future<NotificationResponseModel> getNotifications(int page);
  Future<void> markNotificationAsRead(String id);
  Future<void> marksAllNotificationsAsRead();
}

class NotificationsRepositoryImpl extends NotificationsRepository {
  final NotificationsService _service = NotificationsLocator().get();
  @override
  Future<NotificationResponseModel> getNotifications(int page) {
    return _service.getNotifications(page);
  }

  @override
  Future<void> markNotificationAsRead(String id) {
    return _service.markNotificationAsRead(id);
  }

  @override
  Future<void> marksAllNotificationsAsRead() {
    return _service.marksAllNotificationsAsRead();
  }
}
