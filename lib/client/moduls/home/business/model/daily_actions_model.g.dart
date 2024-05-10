// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_actions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyActionsModel _$DailyActionsModelFromJson(Map<String, dynamic> json) =>
    DailyActionsModel(
      completedProgramSection: json['completedProgramSection'] as bool,
      readArticle: json['readArticle'] as bool,
      loggedSymptomSeverity: json['loggedSymptomSeverity'] as bool,
      recommendedArticle: RecommendedArticleModel.fromJson(
          json['recommendedArticle'] as Map<String, dynamic>),
      recommendedProgramSection: ProgramSectionModel.fromJson(
          json['recommendedProgramSection'] as Map<String, dynamic>),
      loggedSeverityValue: json['loggedSeverityValue'] as int?,
    );

Map<String, dynamic> _$DailyActionsModelToJson(DailyActionsModel instance) =>
    <String, dynamic>{
      'completedProgramSection': instance.completedProgramSection,
      'readArticle': instance.readArticle,
      'loggedSymptomSeverity': instance.loggedSymptomSeverity,
      'recommendedArticle': instance.recommendedArticle,
      'recommendedProgramSection': instance.recommendedProgramSection,
      'loggedSeverityValue': instance.loggedSeverityValue,
    };

RecommendedArticleModel _$RecommendedArticleModelFromJson(
        Map<String, dynamic> json) =>
    RecommendedArticleModel(
      duration: json['duration'] as int,
      title: json['title'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$RecommendedArticleModelToJson(
        RecommendedArticleModel instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'title': instance.title,
      'id': instance.id,
    };

ProgramSectionModel _$ProgramSectionModelFromJson(Map<String, dynamic> json) =>
    ProgramSectionModel(
      id: json['id'] as String,
      programId:
          ProgramModel.fromJson(json['programId'] as Map<String, dynamic>),
      title: json['title'] as String,
    );

Map<String, dynamic> _$ProgramSectionModelToJson(
        ProgramSectionModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'programId': instance.programId,
      'id': instance.id,
    };

ProgramModel _$ProgramModelFromJson(Map<String, dynamic> json) => ProgramModel(
      title: json['title'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ProgramModelToJson(ProgramModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
    };
