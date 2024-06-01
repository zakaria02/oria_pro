// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_post_comment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPostCommentRequest _$AddPostCommentRequestFromJson(
        Map<String, dynamic> json) =>
    AddPostCommentRequest(
      comment: json['comment'] as String,
      parentId: json['parentId'] as String?,
    );

Map<String, dynamic> _$AddPostCommentRequestToJson(
        AddPostCommentRequest instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'parentId': instance.parentId,
    };
