import 'package:json_annotation/json_annotation.dart';

import '../../../../../utils/constants/oria_links.dart';
import '../../feature/entity/learning_content.dart';
import 'symptom_model.dart';

part 'explore_symptom_article_model.g.dart';

@JsonSerializable()
class ExploreSymptomArticleModel {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "symptom")
  final SymptomModel symptom;
  @JsonKey(name: "articles")
  final List<ArticleModel> articles;

  const ExploreSymptomArticleModel({
    required this.id,
    required this.symptom,
    required this.articles,
  });

  factory ExploreSymptomArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ExploreSymptomArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExploreSymptomArticleModelToJson(this);
}

@JsonSerializable()
class ArticleModel {
  final String id;
  final String title;
  final String thumbnail;
  final bool isPremium;
  final int duration;

  const ArticleModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.isPremium,
    required this.duration,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}

extension ExploreSymptomArticleMapper on ExploreSymptomArticleModel {
  LearningContent toLearningContentUio(String primaryId) {
    return LearningContent(
      contentId: id,
      symptomId: symptom.id,
      symptomName: symptom.name,
      articles: articles.map((article) => article.toArticleUio()).toList(),
      type: LearningContentType.article,
      isPrimarySymptom: symptom.id == primaryId,
    );
  }
}

extension ArticleModelMappers on ArticleModel {
  SymptomArticle toArticleUio() {
    return SymptomArticle(
      id: id,
      title: title,
      thumbnail: "${OriaLinks.stagingArticlesAssetsBaseUrl}/$thumbnail",
      isPremium: isPremium,
      duration: duration,
    );
  }
}
