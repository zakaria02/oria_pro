part of 'notification_bloc.dart';

sealed class NotificationState extends Equatable {
  const NotificationState({
    required this.notifications,
    required this.currentPage,
    required this.pagesCount,
  });
  final List<NotificationEntity> notifications;
  final int currentPage;
  final int pagesCount;

  @override
  List<Object> get props => [notifications, currentPage, pagesCount];
}

final class NotificationInitial extends NotificationState {
  const NotificationInitial()
      : super(
          notifications: const [],
          currentPage: 1,
          pagesCount: 0,
        );
}

final class NotificationLoading extends NotificationState {
  const NotificationLoading({
    required super.notifications,
    required super.currentPage,
    required super.pagesCount,
  });
}

final class NotificationSuccess extends NotificationState {
  const NotificationSuccess({
    required super.notifications,
    required super.currentPage,
    required super.pagesCount,
  });
}

final class NotificationError extends NotificationState {
  final String errorMessage;
  const NotificationError({
    required super.notifications,
    required super.currentPage,
    required super.pagesCount,
    required this.errorMessage,
  });
}
