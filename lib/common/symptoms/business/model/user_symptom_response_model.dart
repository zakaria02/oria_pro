import 'package:json_annotation/json_annotation.dart';

import 'symptom_info_model.dart';

part 'user_symptom_response_model.g.dart';

@JsonSerializable()
class UserSymptomResponseModel {
  @JsonKey(name: "user")
  final String userId;
  @JsonKey(name: "symptom")
  final SymptomInfoModel symptom;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "id")
  final String id;

  const UserSymptomResponseModel({
    required this.userId,
    required this.symptom,
    required this.type,
    required this.id,
  });

  factory UserSymptomResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserSymptomResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserSymptomResponseModelToJson(this);
}
