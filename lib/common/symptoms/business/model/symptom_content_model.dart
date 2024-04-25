import 'package:json_annotation/json_annotation.dart';

import '../../../../client/moduls/explore/business/model/explore_symptom_article_model.dart';
import '../../../../client/moduls/explore/business/model/symptom_programs_model.dart';

part 'symptom_content_model.g.dart';

@JsonSerializable()
class SymptomContentModel {
  final SymptomContentResultModel results;

  const SymptomContentModel({
    required this.results,
  });

  factory SymptomContentModel.fromJson(Map<String, dynamic> json) =>
      _$SymptomContentModelFromJson(json);
  Map<String, dynamic> toJson() => _$SymptomContentModelToJson(this);
}

@JsonSerializable()
class SymptomContentResultModel {
  final List<SymptomProgramsModel> symptomPrograms;
  final List<ArticleModel> symptomArticles;

  const SymptomContentResultModel({
    required this.symptomPrograms,
    required this.symptomArticles,
  });

  factory SymptomContentResultModel.fromJson(Map<String, dynamic> json) =>
      _$SymptomContentResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$SymptomContentResultModelToJson(this);
}
