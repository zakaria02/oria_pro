part of 'notification_bloc.dart';

sealed class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

final class FetchAllNotifications extends NotificationEvent {}

final class MarkAllNotificationsAsRead extends NotificationEvent {}

final class MarkNotificationAsRead extends NotificationEvent {
  final String id;

  const MarkNotificationAsRead({required this.id});
}
