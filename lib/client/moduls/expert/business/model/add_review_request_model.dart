import 'package:json_annotation/json_annotation.dart';

part 'add_review_request_model.g.dart';

@JsonSerializable()
class AddReviewRequestModel {
  final String appointementId;
  final double rating;
  final String review;

  const AddReviewRequestModel({
    required this.appointementId,
    required this.rating,
    required this.review,
  });

  factory AddReviewRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddReviewRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddReviewRequestModelToJson(this);
}
