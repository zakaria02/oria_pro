// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequestModel _$UpdateProfileRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileRequestModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      birthDay: json['birthDay'] == null
          ? null
          : DateTime.parse(json['birthDay'] as String),
      shareMedicalInfo: json['shareMedicalInfo'] as bool? ?? false,
      playerId: json['playerId'] as String?,
    );

Map<String, dynamic> _$UpdateProfileRequestModelToJson(
        UpdateProfileRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'birthDay': instance.birthDay?.toIso8601String(),
      'shareMedicalInfo': instance.shareMedicalInfo,
      'playerId': instance.playerId,
    };
