// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_topic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumTopicModel _$ForumTopicModelFromJson(Map<String, dynamic> json) =>
    ForumTopicModel(
      thumbnail: json['thumbnail'] as String,
      relatedSymptom: json['relatedSymptom'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      id: json['id'] as String,
      isRecommended: json['isRecommended'] as bool? ?? false,
      postCount: (json['postCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ForumTopicModelToJson(ForumTopicModel instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'relatedSymptom': instance.relatedSymptom,
      'title': instance.title,
      'description': instance.description,
      'id': instance.id,
      'isRecommended': instance.isRecommended,
      'postCount': instance.postCount,
    };
