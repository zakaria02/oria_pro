import 'package:oria_pro/client/moduls/explore/feature/entity/post_user.dart';

class NotificationEntity {
  final String content;
  final bool read;
  final NotificationContext context;
  final String resourceId;
  final String id;
  final PostUser? user;
  final DateTime updatedAt;

  const NotificationEntity({
    required this.content,
    required this.read,
    required this.context,
    required this.resourceId,
    required this.id,
    required this.user,
    required this.updatedAt,
  });

  NotificationEntity copyWith({
    String? content,
    bool? read,
    NotificationContext? context,
    String? resourceId,
    String? id,
    PostUser? user,
  }) {
    return NotificationEntity(
      content: content ?? this.content,
      read: read ?? this.read,
      context: context ?? this.context,
      resourceId: resourceId ?? this.resourceId,
      id: id ?? this.id,
      user: user ?? this.user,
      updatedAt: updatedAt,
    );
  }
}

enum NotificationContext {
  post,
  unkonwn,
}
