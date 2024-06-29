import 'package:json_annotation/json_annotation.dart';

part 'delete_symptom_request_model.g.dart';

@JsonSerializable()
class DeleteSymptomRequestModel {
  final String symptomId;

  const DeleteSymptomRequestModel({
    required this.symptomId,
  });

  factory DeleteSymptomRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteSymptomRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteSymptomRequestModelToJson(this);
}
