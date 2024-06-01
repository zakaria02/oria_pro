import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/review.dart';
import 'package:oria_pro/utils/constants/oria_links.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  final UserModel userId;
  final int rating;
  final String review;
  final String id;

  const ReviewModel({
    required this.userId,
    required this.rating,
    required this.review,
    required this.id,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}

@JsonSerializable()
class UserModel {
  final String? profilePicture;
  final String name;

  const UserModel({
    required this.profilePicture,
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

extension ReviewModelMappers on ReviewModel {
  Review toReview() {
    return Review(
      profilePicture:
          "${OriaLinks.stagingProfileAssetsBaseUrl}/${userId.profilePicture}",
      username: userId.name,
      rating: rating,
      review: review,
    );
  }
}
