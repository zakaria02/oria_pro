import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:oria_pro/utils/locator/locator.dart';
import 'package:oria_pro/utils/router/router.dart';

Future<void> initNotification() async {
  final router = AppLocator().get<AppRouter>();

  // check permissions
  OneSignal.initialize("30b7edf3-289d-45b4-8fad-93c4b76fb419");
  await OneSignal.Notifications.requestPermission(true);

  OneSignal.Notifications.addClickListener((event) {
    String? context;
    String? resourceId;

    if (event.notification.additionalData != null) {
      for (var entry in event.notification.additionalData!.entries) {
        if (entry.key == 'context') {
          context = entry.value;
        } else if (entry.key == 'resourceId') {
          resourceId = entry.value;
        }
      }
    }
    if (context != null && resourceId != null) {
      if (context == "post") {
        final isCurrentPost = router.current.name == PostDetailsRoute.name;

        if (!isCurrentPost) {
          router.push(PostDetailsRoute(postId: resourceId));
        } else {
          router.replace(PostDetailsRoute(postId: resourceId));
        }
      } else if (context == "appointment") {
        final isCurrentPost = router.current.name == UpcomingDetailsRoute.name;

        if (!isCurrentPost) {
          router.push(UpcomingDetailsRoute(appointmentId: resourceId));
        } else {
          router.replace(UpcomingDetailsRoute(appointmentId: resourceId));
        }
      }
    }
  });
}
