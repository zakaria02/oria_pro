// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileResponseModel _$UpdateProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileResponseModel(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      birthDay: json['birthDay'] == null
          ? null
          : DateTime.parse(json['birthDay'] as String),
      role: json['role'] as String,
    );

Map<String, dynamic> _$UpdateProfileResponseModelToJson(
        UpdateProfileResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'birthDay': instance.birthDay?.toIso8601String(),
      'role': instance.role,
    };
