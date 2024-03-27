// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_symptom_article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExploreSymptomArticleModel _$ExploreSymptomArticleModelFromJson(
        Map<String, dynamic> json) =>
    ExploreSymptomArticleModel(
      id: json['_id'] as String,
      symptom: SymptomModel.fromJson(json['symptom'] as Map<String, dynamic>),
      articles: (json['articles'] as List<dynamic>)
          .map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExploreSymptomArticleModelToJson(
        ExploreSymptomArticleModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'symptom': instance.symptom,
      'articles': instance.articles,
    };

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      id: json['id'] as String,
      title: json['title'] as String,
      thumbnail: json['thumbnail'] as String,
      isPremium: json['isPremium'] as bool,
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'isPremium': instance.isPremium,
      'duration': instance.duration,
    };
