import 'package:json_annotation/json_annotation.dart';

part 'finish_action_model.g.dart';

@JsonSerializable()
class FinishActionModel {
  final bool completedProgramSection;
  final bool readArticle;
  final bool loggedSymptomSeverity;

  const FinishActionModel({
    required this.completedProgramSection,
    required this.readArticle,
    required this.loggedSymptomSeverity,
  });

  factory FinishActionModel.fromJson(Map<String, dynamic> json) =>
      _$FinishActionModelFromJson(json);
  Map<String, dynamic> toJson() => _$FinishActionModelToJson(this);
}
