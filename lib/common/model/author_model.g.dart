// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorModel _$AuthorModelFromJson(Map<String, dynamic> json) => AuthorModel(
      name: json['name'] as String,
      imageUrl: json['profilePicture'] as String,
      expertise: json['expertise'] as String,
    );

Map<String, dynamic> _$AuthorModelToJson(AuthorModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profilePicture': instance.imageUrl,
      'expertise': instance.expertise,
    };
