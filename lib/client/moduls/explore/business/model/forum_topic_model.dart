import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/utils/constants/oria_links.dart';

import '../../feature/entity/forum_topic.dart';

part 'forum_topic_model.g.dart';

@JsonSerializable()
class ForumTopicModel {
  final String thumbnail;
  final String? relatedSymptom;
  final String title;
  final String description;
  final String id;
  final bool isRecommended;
  final int postCount;

  const ForumTopicModel({
    required this.thumbnail,
    required this.relatedSymptom,
    required this.title,
    required this.description,
    required this.id,
    this.isRecommended = false,
    this.postCount = 0,
  });

  factory ForumTopicModel.fromJson(Map<String, dynamic> json) =>
      _$ForumTopicModelFromJson(json);
  Map<String, dynamic> toJson() => _$ForumTopicModelToJson(this);
}

extension ForumTopicModelMappers on ForumTopicModel {
  ForumTopic toForumTopic() => ForumTopic(
        thumbnail: "${OriaLinks.stagingTopicsAssetsBaseUrl}/$thumbnail",
        title: title,
        description: description,
        id: id,
        postsCount: postCount,
      );
}
