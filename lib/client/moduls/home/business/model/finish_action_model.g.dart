// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finish_action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishActionModel _$FinishActionModelFromJson(Map<String, dynamic> json) =>
    FinishActionModel(
      completedProgramSection: json['completedProgramSection'] as bool,
      readArticle: json['readArticle'] as bool,
      loggedSymptomSeverity: json['loggedSymptomSeverity'] as bool,
    );

Map<String, dynamic> _$FinishActionModelToJson(FinishActionModel instance) =>
    <String, dynamic>{
      'completedProgramSection': instance.completedProgramSection,
      'readArticle': instance.readArticle,
      'loggedSymptomSeverity': instance.loggedSymptomSeverity,
    };
