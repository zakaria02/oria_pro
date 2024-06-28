// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_methodes_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtherMethodesUserModel _$OtherMethodesUserModelFromJson(
        Map<String, dynamic> json) =>
    OtherMethodesUserModel(
      user: json['user'] == null
          ? null
          : UserResponseModel.fromJson(json['user'] as Map<String, dynamic>),
      newUser: json['newUser'] == null
          ? null
          : UserResponseModel.fromJson(json['newUser'] as Map<String, dynamic>),
      tokens:
          TokensResponseModel.fromJson(json['tokens'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OtherMethodesUserModelToJson(
        OtherMethodesUserModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'newUser': instance.newUser,
      'tokens': instance.tokens,
    };
