import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/learning_article.dart';
import 'package:oria_pro/utils/constants/oria_links.dart';

import '../../../../../common/model/author_model.dart';

part 'learning_article.g.dart';

@JsonSerializable()
class LearningArticleModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "duration")
  final int duration;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "isPremium")
  final bool isPremium;
  @JsonKey(name: "thumbnail")
  final String imageurl;
  @JsonKey(name: "author")
  final AuthorModel author;
  @JsonKey(name: "tags")
  final List<String> tags;
  @JsonKey(name: "sources")
  final List<String> sources;
  @JsonKey(name: "content")
  final String htmlContent;
  @JsonKey(name: "isFavorite")
  final bool isFavorite;

  LearningArticleModel({
    required this.id,
    required this.imageurl,
    required this.title,
    required this.author,
    required this.duration,
    required this.isPremium,
    required this.tags,
    required this.sources,
    required this.htmlContent,
    required this.isFavorite,
  });

  factory LearningArticleModel.fromJson(Map<String, dynamic> json) =>
      _$LearningArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$LearningArticleModelToJson(this);
}

extension LearningArticleModelMappers on LearningArticleModel {
  LearningArticle toArticleWithContentUio() {
    return LearningArticle(
      id: id,
      imageurl: "${OriaLinks.stagingArticlesAssetsBaseUrl}/$imageurl",
      title: title,
      duration: duration,
      isPremium: isPremium,
      author: author.toAuthor(),
      tags: tags,
      sources: sources,
      htmlContent: htmlContent,
      isFavorite: isFavorite,
    );
  }
}
