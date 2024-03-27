import 'package:json_annotation/json_annotation.dart';

part 'favorite_request_model.g.dart';

@JsonSerializable()
class FavoriteRequestModel {
  @JsonKey(name: "resourceId")
  final String resourceId;
  @JsonKey(name: "resourceType")
  final String resourceType;

  const FavoriteRequestModel({
    required this.resourceId,
    required this.resourceType,
  });

  factory FavoriteRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteRequestModelToJson(this);
}
