// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_symptom_severity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddSymptomSeverityModel _$AddSymptomSeverityModelFromJson(
        Map<String, dynamic> json) =>
    AddSymptomSeverityModel(
      symptom: json['symptom'] as String,
      severity: (json['severity'] as num).toInt(),
      logDate: json['logDate'] as String,
    );

Map<String, dynamic> _$AddSymptomSeverityModelToJson(
        AddSymptomSeverityModel instance) =>
    <String, dynamic>{
      'symptom': instance.symptom,
      'severity': instance.severity,
      'logDate': instance.logDate,
    };
