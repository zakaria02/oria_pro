import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/tracker/feature/enitity/tracked_symptom.dart';

part 'tracked_symptom_model.g.dart';

@JsonSerializable()
class TrackedSymptomModel {
  @JsonKey(name: "symptom")
  final SymptomModel symptom;
  @JsonKey(name: "id")
  final String id;

  const TrackedSymptomModel({required this.id, required this.symptom});

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
      icon: symptom.icon,
      name: symptom.name,
      id: id,
      symptomId: symptom.id,
    );
  }
}
