// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SymptomContentModel _$SymptomContentModelFromJson(Map<String, dynamic> json) =>
    SymptomContentModel(
      results: SymptomContentResultModel.fromJson(
          json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SymptomContentModelToJson(
        SymptomContentModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

SymptomContentResultModel _$SymptomContentResultModelFromJson(
        Map<String, dynamic> json) =>
    SymptomContentResultModel(
      symptomPrograms: (json['symptomPrograms'] as List<dynamic>)
          .map((e) => SymptomProgramsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      symptomArticles: (json['symptomArticles'] as List<dynamic>)
          .map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedForumTopics: (json['relatedForumTopic'] as List<dynamic>)
          .map((e) => ForumTopicModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SymptomContentResultModelToJson(
        SymptomContentResultModel instance) =>
    <String, dynamic>{
      'symptomPrograms': instance.symptomPrograms,
      'symptomArticles': instance.symptomArticles,
      'relatedForumTopic': instance.relatedForumTopics,
    };
