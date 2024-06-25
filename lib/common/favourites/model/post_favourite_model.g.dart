// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_favourite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostFavouriteModel _$PostFavouriteModelFromJson(Map<String, dynamic> json) =>
    PostFavouriteModel(
      postId: json['postId'] == null
          ? null
          : PostDetails.fromJson(json['postId'] as Map<String, dynamic>),
      userId: json['userId'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$PostFavouriteModelToJson(PostFavouriteModel instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'userId': instance.userId,
      'id': instance.id,
    };

PostDetails _$PostDetailsFromJson(Map<String, dynamic> json) => PostDetails(
      title: json['title'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$PostDetailsToJson(PostDetails instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
    };
