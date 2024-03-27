// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_symptom_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSymptomResponseModel _$UserSymptomResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserSymptomResponseModel(
      userId: json['user'] as String,
      symptom:
          SymptomInfoModel.fromJson(json['symptom'] as Map<String, dynamic>),
      type: json['type'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$UserSymptomResponseModelToJson(
        UserSymptomResponseModel instance) =>
    <String, dynamic>{
      'user': instance.userId,
      'symptom': instance.symptom,
      'type': instance.type,
      'id': instance.id,
    };
