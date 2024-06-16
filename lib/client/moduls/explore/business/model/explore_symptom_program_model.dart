import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/utils/constants/oria_links.dart';

import '../../feature/entity/learning_content.dart';
import '../../feature/programs/entity/program.dart';
import 'symptom_model.dart';

part 'explore_symptom_program_model.g.dart';

@JsonSerializable()
class ExploreSymptomProgramModel {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "symptom")
  final SymptomModel symptom;
  @JsonKey(name: "programs")
  final List<ProgramSymptomModel> programs;

  const ExploreSymptomProgramModel({
    required this.id,
    required this.symptom,
    required this.programs,
  });

  factory ExploreSymptomProgramModel.fromJson(Map<String, dynamic> json) =>
      _$ExploreSymptomProgramModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExploreSymptomProgramModelToJson(this);
}

@JsonSerializable()
class ProgramSymptomModel {
  final String id;
  final String title;
  final String thumbnail;
  final int duration;
  final String learningStatus;

  const ProgramSymptomModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.duration,
    required this.learningStatus,
  });

  factory ProgramSymptomModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramSymptomModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProgramSymptomModelToJson(this);
}

extension ExploreSymptomProgrameMapper on ExploreSymptomProgramModel {
  LearningContent toLearningContentUio(
      String primaryId, List<String> secondarySymptomsIds) {
    return LearningContent(
      contentId: id,
      symptomId: symptom.id,
      symptomName: symptom.name,
      articles: programs.map((article) => article.toArticleUio()).toList(),
      type: LearningContentType.program,
      isPrimarySymptom: symptom.id == primaryId,
      isSecondarySymptom: secondarySymptomsIds.contains(symptom.id),
    );
  }
}

extension ArticleModelMappers on ProgramSymptomModel {
  SymptomArticle toArticleUio() {
    return SymptomArticle(
      id: id,
      title: title,
      thumbnail: "${OriaLinks.stagingProgramsAssetsBaseUrl}/$thumbnail",
      isPremium: false,
      duration: duration,
      finished: learningStatus == "finished",
      started: learningStatus == "started",
    );
  }

  Program toProgram() {
    return Program(
      id: id,
      title: title,
      imageUrl: "${OriaLinks.stagingProgramsAssetsBaseUrl}/$thumbnail",
      duration: duration,
      finished: learningStatus == "finished",
      started: learningStatus == "started",
    );
  }
}
