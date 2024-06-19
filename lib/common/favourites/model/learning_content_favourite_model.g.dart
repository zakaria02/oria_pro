// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_content_favourite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningContentFavouriteModel _$LearningContentFavouriteModelFromJson(
        Map<String, dynamic> json) =>
    LearningContentFavouriteModel(
      resourceId: json['resourceId'] as String,
      resourceType: json['resourceType'] as String,
      resourceDetails: ResourceDetailsModel.fromJson(
          json['resourceDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LearningContentFavouriteModelToJson(
        LearningContentFavouriteModel instance) =>
    <String, dynamic>{
      'resourceId': instance.resourceId,
      'resourceType': instance.resourceType,
      'resourceDetails': instance.resourceDetails,
    };

ResourceDetailsModel _$ResourceDetailsModelFromJson(
        Map<String, dynamic> json) =>
    ResourceDetailsModel(
      title: json['title'] as String,
    );

Map<String, dynamic> _$ResourceDetailsModelToJson(
        ResourceDetailsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
