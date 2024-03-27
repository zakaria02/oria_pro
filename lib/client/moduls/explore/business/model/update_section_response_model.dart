import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/explore/business/model/program_model.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/entity/symptom_program.dart';
import 'package:oria_pro/utils/constants/oria_links.dart';

part 'update_section_response_model.g.dart';

@JsonSerializable()
class ProgramSectionWithContentModel extends ProgramSectionModel {
  @JsonKey(name: "content")
  final String content;

  ProgramSectionWithContentModel({
    required super.description,
    required super.type,
    required super.duration,
    required super.isPremium,
    required super.selectionOrder,
    required super.title,
    required super.imageUrl,
    required super.programId,
    required super.id,
    super.sectionStatus,
    required this.content,
  });

  factory ProgramSectionWithContentModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramSectionWithContentModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ProgramSectionWithContentModelToJson(this);
}

extension UpdateSectionResponseModelMappers on ProgramSectionWithContentModel {
  ProgramSectionWithContent toProgramSectionWithContent() {
    return ProgramSectionWithContent(
      description: description,
      type: type.toSectionType(),
      duration: duration,
      isPremium: isPremium,
      selectionOrder: selectionOrder,
      title: title,
      imageUrl: "${OriaLinks.stagingProgramsAssetsBaseUrl}/$imageUrl",
      programId: programId,
      id: id,
      sectionStatus: sectionStatus?.toLearningStatus(),
      content: content,
    );
  }
}
