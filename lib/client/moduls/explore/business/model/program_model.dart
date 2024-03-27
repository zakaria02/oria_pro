import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/utils/constants/oria_links.dart';

import '../../../../../common/model/author_model.dart';
import '../../feature/programs/entity/symptom_program.dart';

part 'program_model.g.dart';

@JsonSerializable()
class ProgramModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "thumbnail")
  final String imageUrl;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "duration")
  final int duration;
  @JsonKey(name: "tags")
  final List<String> tags;
  @JsonKey(name: "author")
  final AuthorModel author;
  @JsonKey(name: "sections")
  final List<ProgramSectionModel> sections;
  @JsonKey(name: "isPremium")
  final bool isPremium;
  @JsonKey(name: "learningStatus")
  final String programStatus;

  const ProgramModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.duration,
    required this.tags,
    required this.author,
    required this.sections,
    required this.isPremium,
    required this.programStatus,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProgramModelToJson(this);
}

@JsonSerializable()
class ProgramSectionModel {
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "contentType")
  final String type;
  @JsonKey(name: "duration")
  final int duration;
  @JsonKey(name: "isPremium")
  final bool isPremium;
  @JsonKey(name: "sectionOrder")
  final int selectionOrder;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "thumbnail")
  final String? imageUrl;
  @JsonKey(name: "programId")
  final String programId;
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "learningStatus")
  final String? sectionStatus;

  const ProgramSectionModel({
    required this.description,
    required this.type,
    required this.duration,
    required this.isPremium,
    required this.selectionOrder,
    required this.title,
    required this.imageUrl,
    required this.programId,
    required this.id,
    required this.sectionStatus,
  });

  factory ProgramSectionModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramSectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProgramSectionModelToJson(this);
}

extension ProgramModelMappers on ProgramModel {
  SymptomProgram toSymptomProgram() {
    List<ProgramSection> programSections =
        sections.map((sec) => sec.toProgramSection()).toList();
    programSections
        .sort((a, b) => a.selectionOrder.compareTo(b.selectionOrder));

    return SymptomProgram(
      id: id,
      title: title,
      image: "${OriaLinks.stagingProgramsAssetsBaseUrl}/$imageUrl",
      description: description,
      duration: duration,
      author: author.toAuthor(),
      sections: programSections,
      isPremium: isPremium,
      programStatus: programStatus.toLearningStatus(),
    );
  }
}

extension ProgramSectionModelMapper on ProgramSectionModel {
  ProgramSection toProgramSection() {
    return ProgramSection(
      description: description,
      type: type.toSectionType(),
      duration: duration,
      isPremium: isPremium,
      selectionOrder: selectionOrder,
      title: title,
      imageUrl: imageUrl,
      programId: programId,
      id: id,
      sectionStatus:
          sectionStatus?.toLearningStatus() ?? LearningStatus.notStarted,
    );
  }
}

extension ProgramStrings on String {
  LearningStatus toLearningStatus() {
    return switch (this) {
      "notStarted" => LearningStatus.notStarted,
      "started" => LearningStatus.started,
      "finished" => LearningStatus.finished,
      _ => throw Exception("Learning status not found")
    };
  }

  SectionType toSectionType() {
    return switch (this) {
      "article" => SectionType.article,
      "video" => SectionType.video,
      "audio" => SectionType.audio,
      _ => throw Exception("Section type not found")
    };
  }
}
