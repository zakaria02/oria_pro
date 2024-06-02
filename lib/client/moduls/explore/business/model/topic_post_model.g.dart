// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostTopicModelResults _$PostTopicModelResultsFromJson(
        Map<String, dynamic> json) =>
    PostTopicModelResults(
      results: (json['results'] as List<dynamic>)
          .map((e) => PostTopicModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostTopicModelResultsToJson(
        PostTopicModelResults instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

PostTopicModel _$PostTopicModelFromJson(Map<String, dynamic> json) =>
    PostTopicModel(
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      title: json['title'] as String,
      content: json['content'] as String? ?? "",
      user: PostUserModel.fromJson(json['user'] as Map<String, dynamic>),
      topicId: json['topicId'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      id: json['id'] as String,
      isOwner: json['isOwner'] as bool,
      commentCount: (json['commentCount'] as num?)?.toInt() ?? 0,
      likeCount: (json['likeCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PostTopicModelToJson(PostTopicModel instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'title': instance.title,
      'content': instance.content,
      'user': instance.user,
      'topicId': instance.topicId,
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'isOwner': instance.isOwner,
      'commentCount': instance.commentCount,
      'likeCount': instance.likeCount,
    };
