// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      parentId: json['parentId'] as String?,
      comment: json['comment'] as String,
      userId: PostUserModel.fromJson(json['userId'] as Map<String, dynamic>),
      postId: json['postId'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      id: json['id'] as String,
      subComments: (json['subComments'] as List<dynamic>?)
              ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      likeCount: (json['likeCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'parentId': instance.parentId,
      'comment': instance.comment,
      'userId': instance.userId,
      'postId': instance.postId,
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'subComments': instance.subComments,
      'likeCount': instance.likeCount,
    };
