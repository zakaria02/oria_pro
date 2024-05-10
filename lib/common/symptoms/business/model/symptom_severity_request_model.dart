import 'package:json_annotation/json_annotation.dart';

part 'symptom_severity_request_model.g.dart';

@JsonSerializable()
class SymptomSeverityRequestModel {
  @JsonKey(name: "symptom")
  final String symptomId;
  @JsonKey(name: "severity")
  final int severity;
  @JsonKey(name: "logDate")
  final DateTime logDate;

  const SymptomSeverityRequestModel({
    required this.symptomId,
    required this.severity,
    required this.logDate,
  });

  factory SymptomSeverityRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SymptomSeverityRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$SymptomSeverityRequestModelToJson(this);
}
