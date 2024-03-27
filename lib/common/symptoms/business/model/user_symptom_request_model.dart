import 'package:json_annotation/json_annotation.dart';

part "user_symptom_request_model.g.dart";

@JsonSerializable()
class UserSymptomRequestModel {
  @JsonKey(name: "symptomId")
  final String symptomId;
  @JsonKey(name: "type")
  final String type;

  const UserSymptomRequestModel({required this.symptomId, required this.type});

  factory UserSymptomRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserSymptomRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserSymptomRequestModelToJson(this);
}
