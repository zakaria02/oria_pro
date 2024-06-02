import 'package:json_annotation/json_annotation.dart';

part "daily_actions_model.g.dart";

@JsonSerializable()
class DailyActionsModel {
  final bool completedProgramSection;
  final bool readArticle;
  final bool loggedSymptomSeverity;
  final RecommendedArticleModel? recommendedArticle;
  final ProgramSectionModel? recommendedProgramSection;
  final int? loggedSeverityValue;

  const DailyActionsModel({
    required this.completedProgramSection,
    required this.readArticle,
    required this.loggedSymptomSeverity,
    required this.recommendedArticle,
    required this.recommendedProgramSection,
    required this.loggedSeverityValue,
  });

  factory DailyActionsModel.fromJson(Map<String, dynamic> json) =>
      _$DailyActionsModelFromJson(json);
  Map<String, dynamic> toJson() => _$DailyActionsModelToJson(this);
}

@JsonSerializable()
class RecommendedArticleModel {
  final int duration;
  final String title;
  final String id;

  const RecommendedArticleModel({
    required this.duration,
    required this.title,
    required this.id,
  });

  factory RecommendedArticleModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendedArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendedArticleModelToJson(this);
}

@JsonSerializable()
class ProgramSectionModel {
  final String title;
  final ProgramModel programId;
  final String id;

  const ProgramSectionModel({
    required this.id,
    required this.programId,
    required this.title,
  });

  factory ProgramSectionModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramSectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProgramSectionModelToJson(this);
}

@JsonSerializable()
class ProgramModel {
  final String title;
  final String id;

  const ProgramModel({
    required this.title,
    required this.id,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProgramModelToJson(this);
}
