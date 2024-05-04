import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/tracker/feature/enitity/tracked_symptom.dart';
import 'package:oria_pro/utils/constants/oria_links.dart';
import 'activity_model.dart';

part 'tracked_symptom_model.g.dart';

@JsonSerializable()
class TrackedSymptomModel {
  @JsonKey(name: "symptom")
  final SymptomModel symptom;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "logEventValue")
  final int? logEventValue;
  @JsonKey(name: "isLogged")
  final bool isLogged;
  @JsonKey(name: "logEventId")
  final String? logEventId;
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "loggedActivites")
  final List<ActivityModel> loggedActivites;

  const TrackedSymptomModel({
    required this.id,
    required this.symptom,
    required this.isLogged,
    required this.logEventId,
    required this.logEventValue,
    required this.type,
    required this.loggedActivites,
  });

  factory TrackedSymptomModel.fromJson(Map<String, dynamic> json) =>
      _$TrackedSymptomModelFromJson(json);
  Map<String, dynamic> toJson() => _$TrackedSymptomModelToJson(this);
}

@JsonSerializable()
class SymptomModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "icon")
  final String icon;

  const SymptomModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory SymptomModel.fromJson(Map<String, dynamic> json) =>
      _$SymptomModelFromJson(json);
  Map<String, dynamic> toJson() => _$SymptomModelToJson(this);
}

extension TrackedSymptomModelMappers on TrackedSymptomModel {
  TrackedSymptom toTrackedSymptom() {
    return TrackedSymptom(
      icon: "${OriaLinks.stagingSymptomsAssetsBaseUrl}/${symptom.icon}",
      name: symptom.name,
      id: id,
      symptomId: symptom.id,
      isPrimary: type == "primary",
      logEventValue: logEventValue,
      logEventId: logEventId,
      loggedActivities: loggedActivites
          .map(
            (activity) => activity.toActivity(),
          )
          .toList(),
    );
  }
}
