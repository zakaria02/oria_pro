class LearningContent {
  final String contentId;
  final String symptomId;
  final String symptomName;
  final List<SymptomArticle> articles;
  final LearningContentType type;
  final bool isPrimarySymptom;
  final bool isSecondarySymptom;

  const LearningContent({
    required this.contentId,
    required this.symptomId,
    required this.symptomName,
    required this.articles,
    required this.type,
    required this.isPrimarySymptom,
    required this.isSecondarySymptom,
  });
}

class SymptomArticle {
  final String id;
  final String title;
  final String thumbnail;
  final bool isPremium;
  final int duration;
  final bool? finished;
  final bool? started;

  const SymptomArticle({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.isPremium,
    required this.duration,
    this.finished,
    this.started,
  });
}

enum LearningContentType { article, program }
