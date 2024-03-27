// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    AuthResponseModel(
      user: UserResponseModel.fromJson(json['user'] as Map<String, dynamic>),
      tokens:
          TokensResponseModel.fromJson(json['tokens'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseModelToJson(AuthResponseModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'tokens': instance.tokens,
    };

TokenResponseModel _$TokenResponseModelFromJson(Map<String, dynamic> json) =>
    TokenResponseModel(
      token: json['token'] as String,
      expires: DateTime.parse(json['expires'] as String),
    );

Map<String, dynamic> _$TokenResponseModelToJson(TokenResponseModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expires': instance.expires.toIso8601String(),
    };

TokensResponseModel _$TokensResponseModelFromJson(Map<String, dynamic> json) =>
    TokensResponseModel(
      accessToken:
          TokenResponseModel.fromJson(json['access'] as Map<String, dynamic>),
      refreshToken:
          TokenResponseModel.fromJson(json['refresh'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokensResponseModelToJson(
        TokensResponseModel instance) =>
    <String, dynamic>{
      'access': instance.accessToken,
      'refresh': instance.refreshToken,
    };
