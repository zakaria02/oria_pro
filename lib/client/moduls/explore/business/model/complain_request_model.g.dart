// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complain_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplainPostRequestModel _$ComplainPostRequestModelFromJson(
        Map<String, dynamic> json) =>
    ComplainPostRequestModel(
      postId: json['postId'] as String,
    );

Map<String, dynamic> _$ComplainPostRequestModelToJson(
        ComplainPostRequestModel instance) =>
    <String, dynamic>{
      'postId': instance.postId,
    };

ComplainCommentRequestModel _$ComplainCommentRequestModelFromJson(
        Map<String, dynamic> json) =>
    ComplainCommentRequestModel(
      commentId: json['commentId'] as String,
    );

Map<String, dynamic> _$ComplainCommentRequestModelToJson(
        ComplainCommentRequestModel instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
    };
