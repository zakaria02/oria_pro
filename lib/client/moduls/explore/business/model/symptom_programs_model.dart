import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/entity/program.dart';
import 'package:oria_pro/utils/constants/oria_links.dart';

part 'symptom_programs_model.g.dart';

@JsonSerializable()
class SymptomProgramsResultModel {
  @JsonKey(name: "results")
  final List<SymptomProgramsModel> results;

  const SymptomProgramsResultModel({required this.results});

  factory SymptomProgramsResultModel.fromJson(Map<String, dynamic> json) =>
      _$SymptomProgramsResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$SymptomProgramsResultModelToJson(this);
}

@JsonSerializable()
class SymptomProgramsModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "duration")
  final int duration;
  @JsonKey(name: "thumbnail")
  final String imageUrl;
  @JsonKey(name: "title")
  final String title;

  const SymptomProgramsModel({
    required this.id,
    required this.duration,
    required this.imageUrl,
    required this.title,
  });

  factory SymptomProgramsModel.fromJson(Map<String, dynamic> json) =>
      _$SymptomProgramsModelFromJson(json);
  Map<String, dynamic> toJson() => _$SymptomProgramsModelToJson(this);
}

extension SymptomProgramsModelMappers on SymptomProgramsModel {
  Program toProgram() {
    return Program(
      id: id,
      title: title,
      imageUrl: "${OriaLinks.stagingProgramsAssetsBaseUrl}/$imageUrl",
      duration: duration,
    );
  }
}
