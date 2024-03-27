// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningArticleModel _$LearningArticleModelFromJson(
        Map<String, dynamic> json) =>
    LearningArticleModel(
      id: json['id'] as String,
      imageurl: json['thumbnail'] as String,
      title: json['title'] as String,
      author: AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
      duration: json['duration'] as int,
      isPremium: json['isPremium'] as bool,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      sources:
          (json['sources'] as List<dynamic>).map((e) => e as String).toList(),
      htmlContent: json['content'] as String,
      isFavorite: json['isFavorite'] as bool,
    );

Map<String, dynamic> _$LearningArticleModelToJson(
        LearningArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'duration': instance.duration,
      'title': instance.title,
      'isPremium': instance.isPremium,
      'thumbnail': instance.imageurl,
      'author': instance.author,
      'tags': instance.tags,
      'sources': instance.sources,
      'content': instance.htmlContent,
      'isFavorite': instance.isFavorite,
    };
