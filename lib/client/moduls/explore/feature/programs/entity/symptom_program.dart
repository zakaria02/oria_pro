import '../../../../../../common/entity/author.dart';

class SymptomProgram {
  final String id;
  final String title;
  final String image;
  final String description;
  final int duration;
  final Author author;
  final List<ProgramSection> sections;
  final bool isPremium;
  final LearningStatus programStatus;

  const SymptomProgram({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.duration,
    required this.author,
    required this.sections,
    required this.isPremium,
    required this.programStatus,
  });

  SymptomProgram copyWith({
    String? id,
    String? title,
    String? image,
    String? description,
    int? duration,
    Author? author,
    List<ProgramSection>? sections,
    bool? isPremium,
    LearningStatus? programStatus,
  }) =>
      SymptomProgram(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        description: description ?? this.description,
        duration: duration ?? this.duration,
        author: author ?? this.author,
        sections: sections ?? this.sections,
        isPremium: isPremium ?? this.isPremium,
        programStatus: programStatus ?? this.programStatus,
      );
}

class ProgramSection {
  final String description;
  final SectionType type;
  final int duration;
  final bool isPremium;
  final int selectionOrder;
  final String title;
  final String? imageUrl;
  final String programId;
  final String id;
  final LearningStatus? sectionStatus;

  const ProgramSection({
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

  ProgramSection copyWith({
    String? description,
    SectionType? type,
    int? duration,
    bool? isPremium,
    int? selectionOrder,
    String? title,
    String? imageUrl,
    String? programId,
    String? id,
    LearningStatus? sectionStatus,
  }) =>
      ProgramSection(
        description: description ?? this.description,
        type: type ?? this.type,
        duration: duration ?? this.duration,
        isPremium: isPremium ?? this.isPremium,
        selectionOrder: selectionOrder ?? this.selectionOrder,
        title: title ?? this.title,
        imageUrl: imageUrl ?? this.imageUrl,
        programId: programId ?? this.programId,
        id: id ?? this.id,
        sectionStatus: sectionStatus ?? this.sectionStatus,
      );
}

class ProgramSectionWithContent extends ProgramSection {
  final String content;
  ProgramSectionWithContent({
    required super.description,
    required super.type,
    required super.duration,
    required super.isPremium,
    required super.selectionOrder,
    required super.title,
    required super.imageUrl,
    required super.programId,
    required super.id,
    required super.sectionStatus,
    required this.content,
  });
}

enum LearningStatus { notStarted, started, finished }

enum SectionType { article, audio, video }
