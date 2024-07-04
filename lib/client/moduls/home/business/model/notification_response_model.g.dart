// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponseModel _$NotificationResponseModelFromJson(
        Map<String, dynamic> json) =>
    NotificationResponseModel(
      results: (json['results'] as List<dynamic>)
          .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalResults: (json['totalResults'] as num).toInt(),
    );

Map<String, dynamic> _$NotificationResponseModelToJson(
        NotificationResponseModel instance) =>
    <String, dynamic>{
      'results': instance.results,
      'page': instance.page,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      read: json['read'] as bool,
      content: json['content'] as String,
      resourceId: json['resourceId'] as String,
      context: json['context'] as String,
      userId: json['userId'] as String?,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      id: json['id'] as String,
      user: json['user'] == null
          ? null
          : PostUserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'read': instance.read,
      'content': instance.content,
      'resourceId': instance.resourceId,
      'context': instance.context,
      'userId': instance.userId,
      'updated_at': instance.updatedAt.toIso8601String(),
      'id': instance.id,
      'user': instance.user,
    };
