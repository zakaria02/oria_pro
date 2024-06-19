import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/account/feature/entity/favourite.dart';

part 'learning_content_favourite_model.g.dart';

@JsonSerializable()
class LearningContentFavouriteModel {
  final String resourceId;
  final String resourceType;
  final ResourceDetailsModel resourceDetails;

  const LearningContentFavouriteModel({
    required this.resourceId,
    required this.resourceType,
    required this.resourceDetails,
  });

  factory LearningContentFavouriteModel.fromJson(Map<String, dynamic> json) =>
      _$LearningContentFavouriteModelFromJson(json);
  Map<String, dynamic> toJson() => _$LearningContentFavouriteModelToJson(this);
}

@JsonSerializable()
class ResourceDetailsModel {
  final String title;

  const ResourceDetailsModel({
    required this.title,
  });

  factory ResourceDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ResourceDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResourceDetailsModelToJson(this);
}

extension LearningContentFavouriteModelMappers
    on LearningContentFavouriteModel {
  Favourite toFavourite() {
    return Favourite(
      resourceId: resourceId,
      resourceType: resourceType,
      title: resourceDetails.title,
    );
  }
}
