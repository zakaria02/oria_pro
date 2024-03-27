// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_severity_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SymptomSeverityRequestModel _$SymptomSeverityRequestModelFromJson(
        Map<String, dynamic> json) =>
    SymptomSeverityRequestModel(
      symptomId: json['symptom'] as String,
      severity: json['severity'] as int,
    );

Map<String, dynamic> _$SymptomSeverityRequestModelToJson(
        SymptomSeverityRequestModel instance) =>
    <String, dynamic>{
      'symptom': instance.symptomId,
      'severity': instance.severity,
    };
