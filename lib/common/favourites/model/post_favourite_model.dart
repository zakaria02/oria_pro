import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/account/feature/entity/favourite.dart';

part 'post_favourite_model.g.dart';

@JsonSerializable()
class PostFavouriteModel {
  final PostDetails postId;
  final String userId;
  final String id;

  const PostFavouriteModel({
    required this.postId,
    required this.userId,
    required this.id,
  });

  factory PostFavouriteModel.fromJson(Map<String, dynamic> json) =>
      _$PostFavouriteModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostFavouriteModelToJson(this);
}

@JsonSerializable()
class PostDetails {
  final String title;
  final String id;

  const PostDetails({
    required this.title,
    required this.id,
  });

  factory PostDetails.fromJson(Map<String, dynamic> json) =>
      _$PostDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$PostDetailsToJson(this);
}

extension PostFavouriteModelMappers on PostFavouriteModel {
  Favourite toFavourite() {
    return Favourite(
      resourceId: postId.id,
      resourceType: "post",
      title: postId.title,
    );
  }
}
