// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_forum_post_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddForumPostRequestModel _$AddForumPostRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddForumPostRequestModel(
      title: json['title'] as String,
      content: json['content'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AddForumPostRequestModelToJson(
        AddForumPostRequestModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'tags': instance.tags,
    };
