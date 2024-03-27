// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_symptom_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSymptomRequestModel _$UserSymptomRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserSymptomRequestModel(
      symptomId: json['symptomId'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$UserSymptomRequestModelToJson(
        UserSymptomRequestModel instance) =>
    <String, dynamic>{
      'symptomId': instance.symptomId,
      'type': instance.type,
    };
