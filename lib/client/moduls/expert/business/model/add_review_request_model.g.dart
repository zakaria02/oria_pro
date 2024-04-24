// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_review_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddReviewRequestModel _$AddReviewRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddReviewRequestModel(
      appointementId: json['appointementId'] as String,
      rating: (json['rating'] as num).toDouble(),
      review: json['review'] as String,
    );

Map<String, dynamic> _$AddReviewRequestModelToJson(
        AddReviewRequestModel instance) =>
    <String, dynamic>{
      'appointementId': instance.appointementId,
      'rating': instance.rating,
      'review': instance.review,
    };
