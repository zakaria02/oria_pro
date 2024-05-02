// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracked_symptom_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackedSymptomModel _$TrackedSymptomModelFromJson(Map<String, dynamic> json) =>
    TrackedSymptomModel(
      id: json['id'] as String,
      symptom: SymptomModel.fromJson(json['symptom'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrackedSymptomModelToJson(
        TrackedSymptomModel instance) =>
    <String, dynamic>{
      'symptom': instance.symptom,
      'id': instance.id,
    };

SymptomModel _$SymptomModelFromJson(Map<String, dynamic> json) => SymptomModel(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$SymptomModelToJson(SymptomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };
