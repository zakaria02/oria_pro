import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/specialty.dart';
import 'package:oria_pro/utils/constants/oria_links.dart';
import 'package:oria_pro/utils/extensions/string_extensions.dart';

part 'specialty_response_model.g.dart';

@JsonSerializable()
class SpecialtyReposneModel {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "icon")
  final String icon;
  @JsonKey(name: "color")
  final String color;
  @JsonKey(name: "id")
  final String id;

  const SpecialtyReposneModel({
    required this.color,
    required this.icon,
    required this.id,
    required this.name,
  });

  factory SpecialtyReposneModel.fromJson(Map<String, dynamic> json) =>
      _$SpecialtyReposneModelFromJson(json);
  Map<String, dynamic> toJson() => _$SpecialtyReposneModelToJson(this);
}

extension SpecialityReposneModelMappers on SpecialtyReposneModel {
  Specialty toSpeciality() {
    return Specialty(
        color: color.toColor(),
        icon: "${OriaLinks.stagingSpecialitiesAssetsBaseUrl}/$icon",
        id: id,
        name: name);
  }
}
