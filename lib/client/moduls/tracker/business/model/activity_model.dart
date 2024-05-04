import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/utils/constants/oria_links.dart';

import '../../feature/enitity/activity.dart';

part 'activity_model.g.dart';

@JsonSerializable()
class ActivityModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "icon")
  final String icon;

  const ActivityModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);
}

extension ActivityModelMappers on ActivityModel {
  Activity toActivity() {
    return Activity(
      icon: "${OriaLinks.stagingActivitiesAssetsBaseUrl}/$icon",
      name: name,
      id: id,
    );
  }
}
