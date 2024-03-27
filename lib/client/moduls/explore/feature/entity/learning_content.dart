class LearningContent {
  final String contentId;
  final String symptomId;
  final String symptomName;
  final List<SymptomArticle> articles;
  final LearningContentType type;

  const LearningContent({
    required this.contentId,
    required this.symptomId,
    required this.symptomName,
    required this.articles,
    required this.type,
  });
}

class SymptomArticle {
  final String id;
  final String title;
  final String thumbnail;
  final bool isPremium;
  final int duration;

  const SymptomArticle({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.isPremium,
    required this.duration,
  });
}

enum LearningContentType { article, program }
