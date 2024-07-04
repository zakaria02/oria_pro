import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/explore/business/model/post_user_model.dart';

import '../../feature/entity/notification.dart';

part 'notification_response_model.g.dart';

@JsonSerializable()
class NotificationResponseModel {
  final List<NotificationModel> results;
  final int page;
  final int limit;
  final int totalPages;
  final int totalResults;

  const NotificationResponseModel({
    required this.results,
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.totalResults,
  });

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationResponseModelToJson(this);
}

@JsonSerializable()
class NotificationModel {
  final bool read;
  final String content;
  final String resourceId;
  final String context;
  final String? userId;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  final String id;
  final PostUserModel? user;

  const NotificationModel({
    required this.read,
    required this.content,
    required this.resourceId,
    required this.context,
    required this.userId,
    required this.updatedAt,
    required this.id,
    required this.user,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}

extension NotificationResponseModelMapper on NotificationResponseModel {
  List<NotificationEntity> toNotifications() {
    return results
        .map((notif) => NotificationEntity(
              content: notif.content,
              read: notif.read,
              context: switch (notif.context) {
                "post" => NotificationContext.post,
                _ => NotificationContext.unkonwn,
              },
              resourceId: notif.resourceId,
              id: notif.id,
              user: notif.user?.toPostUser(),
              updatedAt: notif.updatedAt,
            ))
        .toList();
  }
}
