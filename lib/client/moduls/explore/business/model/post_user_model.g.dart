// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostUserModel _$PostUserModelFromJson(Map<String, dynamic> json) =>
    PostUserModel(
      profilePicture: json['profilePicture'] as String?,
      name: json['name'] as String,
      id: json['id'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$PostUserModelToJson(PostUserModel instance) =>
    <String, dynamic>{
      'profilePicture': instance.profilePicture,
      'name': instance.name,
      'id': instance.id,
      'role': instance.role,
    };
