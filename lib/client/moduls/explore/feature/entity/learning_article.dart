import 'package:oria_pro/common/entity/author.dart';

class LearningArticle {
  final String id;
  final int duration;
  final bool isPremium;
  final String imageurl;
  final String title;
  final Author author;
  final List<String> tags;
  final List<String> sources;
  final String htmlContent;
  final bool isFavorite;

  LearningArticle({
    required this.id,
    required this.imageurl,
    required this.title,
    required this.duration,
    required this.isPremium,
    required this.tags,
    required this.sources,
    required this.htmlContent,
    required this.author,
    required this.isFavorite,
  });

  LearningArticle copyWith({
    String? id,
    int? duration,
    bool? isPremium,
    String? imageurl,
    String? title,
    Author? author,
    List<String>? tags,
    List<String>? sources,
    String? htmlContent,
    bool? isFavorite,
  }) =>
      LearningArticle(
        id: id ?? this.id,
        imageurl: imageurl ?? this.imageurl,
        title: title ?? this.title,
        duration: duration ?? this.duration,
        isPremium: isPremium ?? this.isPremium,
        tags: tags ?? this.tags,
        sources: sources ?? this.sources,
        htmlContent: htmlContent ?? this.htmlContent,
        author: author ?? this.author,
        isFavorite: isFavorite ?? this.isFavorite,
      );
}
