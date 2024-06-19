// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert_favourite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpertFavouriteModel _$ExpertFavouriteModelFromJson(
        Map<String, dynamic> json) =>
    ExpertFavouriteModel(
      user: json['user'] as String,
      resourceId: json['resourceId'] as String,
      resourceType: json['resourceType'] as String,
      resourceDetails: ResourceDetails.fromJson(
          json['resourceDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExpertFavouriteModelToJson(
        ExpertFavouriteModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'resourceId': instance.resourceId,
      'resourceType': instance.resourceType,
      'resourceDetails': instance.resourceDetails,
    };

ResourceDetails _$ResourceDetailsFromJson(Map<String, dynamic> json) =>
    ResourceDetails(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$ResourceDetailsToJson(ResourceDetails instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
