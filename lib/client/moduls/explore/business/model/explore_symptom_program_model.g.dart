// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_symptom_program_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExploreSymptomProgramModel _$ExploreSymptomProgramModelFromJson(
        Map<String, dynamic> json) =>
    ExploreSymptomProgramModel(
      id: json['_id'] as String,
      symptom: SymptomModel.fromJson(json['symptom'] as Map<String, dynamic>),
      programs: (json['programs'] as List<dynamic>)
          .map((e) => ProgramSymptomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExploreSymptomProgramModelToJson(
        ExploreSymptomProgramModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'symptom': instance.symptom,
      'programs': instance.programs,
    };

ProgramSymptomModel _$ProgramSymptomModelFromJson(Map<String, dynamic> json) =>
    ProgramSymptomModel(
      id: json['id'] as String,
      title: json['title'] as String,
      thumbnail: json['thumbnail'] as String,
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$ProgramSymptomModelToJson(
        ProgramSymptomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'duration': instance.duration,
    };
