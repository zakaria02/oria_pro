import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../model/notification_response_model.dart';

part 'notifications_service.g.dart';

@RestApi()
abstract class NotificationsService {
  factory NotificationsService(Dio dio, {String baseUrl}) =
      _NotificationsService;

  @GET("/users/notifications")
  Future<NotificationResponseModel> getNotifications(@Query("page") int page);

  @POST("/users/notifications/{id}/mark-as-read")
  Future<void> markNotificationAsRead(@Path() String id);

  @POST("/users/notifications/mark-all-as-read")
  Future<void> marksAllNotificationsAsRead();
}
