// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) =>
    UserResponseModel(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      role: json['role'] as String,
      hasFinishedOnboarding: json['hasFinishedOnboarding'] as bool,
      birthDay: json['birthDay'] == null
          ? null
          : DateTime.parse(json['birthDay'] as String),
      isEmailVerified: json['isEmailVerified'] as bool,
      profilePicture: json['profilePicture'] as String?,
      shareMedicalInfo: json['shareMedicalInfo'] as bool,
    );

Map<String, dynamic> _$UserResponseModelToJson(UserResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'role': instance.role,
      'hasFinishedOnboarding': instance.hasFinishedOnboarding,
      'birthDay': instance.birthDay?.toIso8601String(),
      'isEmailVerified': instance.isEmailVerified,
      'profilePicture': instance.profilePicture,
      'shareMedicalInfo': instance.shareMedicalInfo,
    };
