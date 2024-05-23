// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_programs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SymptomProgramsResultModel _$SymptomProgramsResultModelFromJson(
        Map<String, dynamic> json) =>
    SymptomProgramsResultModel(
      results: (json['results'] as List<dynamic>)
          .map((e) => SymptomProgramsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SymptomProgramsResultModelToJson(
        SymptomProgramsResultModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

SymptomProgramsModel _$SymptomProgramsModelFromJson(
        Map<String, dynamic> json) =>
    SymptomProgramsModel(
      id: json['id'] as String,
      duration: (json['duration'] as num).toInt(),
      imageUrl: json['thumbnail'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$SymptomProgramsModelToJson(
        SymptomProgramsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'duration': instance.duration,
      'thumbnail': instance.imageUrl,
      'title': instance.title,
    };
