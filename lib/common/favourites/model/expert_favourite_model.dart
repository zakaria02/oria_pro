import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/account/feature/entity/favourite.dart';

part 'expert_favourite_model.g.dart';

@JsonSerializable()
class ExpertFavouriteModel {
  final String user;
  final String resourceId;
  final String resourceType;
  final ResourceDetails resourceDetails;

  const ExpertFavouriteModel({
    required this.user,
    required this.resourceId,
    required this.resourceType,
    required this.resourceDetails,
  });

  factory ExpertFavouriteModel.fromJson(Map<String, dynamic> json) =>
      _$ExpertFavouriteModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExpertFavouriteModelToJson(this);
}

@JsonSerializable()
class ResourceDetails {
  final String firstName;
  final String lastName;

  const ResourceDetails({
    required this.firstName,
    required this.lastName,
  });

  factory ResourceDetails.fromJson(Map<String, dynamic> json) =>
      _$ResourceDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$ResourceDetailsToJson(this);
}

extension ExpertFavouriteModelMappers on ExpertFavouriteModel {
  Favourite toFavourite() {
    return Favourite(
        resourceId: resourceId,
        resourceType: resourceType,
        title: "${resourceDetails.firstName} ${resourceDetails.lastName}");
  }
}
