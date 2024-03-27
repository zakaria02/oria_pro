import 'package:json_annotation/json_annotation.dart';

part 'symptom_model.g.dart';

@JsonSerializable()
class SymptomModel {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "name")
  final String name;

  const SymptomModel({required this.id, required this.name});

  factory SymptomModel.fromJson(Map<String, dynamic> json) =>
      _$SymptomModelFromJson(json);
  Map<String, dynamic> toJson() => _$SymptomModelToJson(this);
}
