// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
