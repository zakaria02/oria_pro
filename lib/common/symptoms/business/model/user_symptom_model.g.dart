// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_symptom_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSymptomModel _$UserSymptomModelFromJson(Map<String, dynamic> json) =>
    UserSymptomModel(
      id: json['id'] as String,
      symptom:
          SymptomInfoModel.fromJson(json['symptom'] as Map<String, dynamic>),
      type: json['type'] as String,
    );

Map<String, dynamic> _$UserSymptomModelToJson(UserSymptomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symptom': instance.symptom,
      'type': instance.type,
    };
