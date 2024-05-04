import 'package:json_annotation/json_annotation.dart';

part 'add_symptom_severity_model.g.dart';

@JsonSerializable()
class AddSymptomSeverityModel {
  final String symptom;
  final int severity;

  const AddSymptomSeverityModel({
    required this.symptom,
    required this.severity,
  });

  factory AddSymptomSeverityModel.fromJson(Map<String, dynamic> json) =>
      _$AddSymptomSeverityModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddSymptomSeverityModelToJson(this);
}
