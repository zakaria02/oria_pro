import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/home/business/model/notification_response_model.dart';
import '../../business/locator/notification_locator.dart';
import '../../business/repository/notifications_repository.dart';
import '../entity/notification.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationInitial()) {
    final NotificationsRepository repository = NotificationsLocator().get();
    on<FetchAllNotifications>((event, emit) async {
      if ((state.currentPage <= state.pagesCount || state.pagesCount == 0) &&
          state is! NotificationLoading) {
        emit(NotificationLoading(
          notifications: state.notifications,
          currentPage: state.currentPage,
          pagesCount: state.pagesCount,
        ));
        try {
          final notifs = await repository.getNotifications(state.currentPage);
          final list = [...state.notifications, ...notifs.toNotifications()];
          list.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
          emit(
            NotificationSuccess(
              notifications: list,
              currentPage: notifs.page + 1,
              pagesCount: notifs.totalPages,
            ),
          );
        } catch (e) {
          emit(
            NotificationError(
              notifications: state.notifications,
              currentPage: state.currentPage,
              pagesCount: state.currentPage,
              errorMessage: e.toString(),
            ),
          );
        }
      }
    });
    on<MarkNotificationAsRead>((event, emit) async {
      final currentNotif =
          state.notifications.firstWhere((notif) => notif.id == event.id);
      if (!currentNotif.read) {
        emit(NotificationLoading(
          notifications: state.notifications,
          currentPage: state.currentPage,
          pagesCount: state.pagesCount,
        ));
        try {
          await repository.markNotificationAsRead(event.id);

          final currentNotifIndex = state.notifications.indexOf(currentNotif);
          List<NotificationEntity> notifs = List.from(state.notifications);
          notifs[currentNotifIndex] = currentNotif.copyWith(read: true);
          emit(
            NotificationSuccess(
              notifications: notifs,
              currentPage: state.currentPage,
              pagesCount: state.pagesCount,
            ),
          );
        } catch (e) {
          emit(
            NotificationError(
              notifications: state.notifications,
              currentPage: state.currentPage,
              pagesCount: state.currentPage,
              errorMessage: e.toString(),
            ),
          );
        }
      }
    });

    on<MarkAllNotificationsAsRead>((event, emit) async {
      emit(NotificationLoading(
        notifications: state.notifications,
        currentPage: state.currentPage,
        pagesCount: state.pagesCount,
      ));
      try {
        await repository.marksAllNotificationsAsRead();
        List<NotificationEntity> notifs = state.notifications
            .map((notif) => notif.copyWith(read: true))
            .toList();
        emit(
          NotificationSuccess(
            notifications: notifs,
            currentPage: state.currentPage,
            pagesCount: state.pagesCount,
          ),
        );
      } catch (e) {
        emit(
          NotificationError(
            notifications: state.notifications,
            currentPage: state.currentPage,
            pagesCount: state.currentPage,
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}
