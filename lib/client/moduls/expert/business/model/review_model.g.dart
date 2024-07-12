// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      userId: json['userId'] == null
          ? null
          : UserModel.fromJson(json['userId'] as Map<String, dynamic>),
      rating: (json['rating'] as num).toInt(),
      review: json['review'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'rating': instance.rating,
      'review': instance.review,
      'id': instance.id,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      profilePicture: json['profilePicture'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'profilePicture': instance.profilePicture,
      'name': instance.name,
    };
