// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentRequestModel _$AddCommentRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddCommentRequestModel(
      comment: json['comment'] as String,
      parentId: json['parentId'] as String?,
    );

Map<String, dynamic> _$AddCommentRequestModelToJson(
    AddCommentRequestModel instance) {
  final val = <String, dynamic>{
    'comment': instance.comment,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parentId', instance.parentId);
  return val;
}
