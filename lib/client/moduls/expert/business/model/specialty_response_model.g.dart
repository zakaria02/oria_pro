// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialty_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialtyReposneModel _$SpecialtyReposneModelFromJson(
        Map<String, dynamic> json) =>
    SpecialtyReposneModel(
      color: json['color'] as String,
      icon: json['icon'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SpecialtyReposneModelToJson(
        SpecialtyReposneModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'color': instance.color,
      'id': instance.id,
    };
