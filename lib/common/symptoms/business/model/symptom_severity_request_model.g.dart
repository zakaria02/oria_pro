// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_severity_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SymptomSeverityRequestModel _$SymptomSeverityRequestModelFromJson(
        Map<String, dynamic> json) =>
    SymptomSeverityRequestModel(
      symptomId: json['symptom'] as String,
      severity: (json['severity'] as num).toInt(),
      logDate: DateTime.parse(json['logDate'] as String),
    );

Map<String, dynamic> _$SymptomSeverityRequestModelToJson(
        SymptomSeverityRequestModel instance) =>
    <String, dynamic>{
      'symptom': instance.symptomId,
      'severity': instance.severity,
      'logDate': instance.logDate.toIso8601String(),
    };
