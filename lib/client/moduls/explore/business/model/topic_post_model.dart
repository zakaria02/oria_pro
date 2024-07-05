import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/topic_post.dart';

import 'post_user_model.dart';

part 'topic_post_model.g.dart';

@JsonSerializable()
class PostTopicModelResults {
  final List<PostTopicModel> results;
  final int page;
  final int totalPages;

  const PostTopicModelResults({
    required this.results,
    required this.page,
    required this.totalPages,
  });

  factory PostTopicModelResults.fromJson(Map<String, dynamic> json) =>
      _$PostTopicModelResultsFromJson(json);
  Map<String, dynamic> toJson() => _$PostTopicModelResultsToJson(this);
}

@JsonSerializable()
class PostTopicModel {
  final List<String> tags;
  final String title;
  final String content;
  final PostUserModel user;
  final String topicId;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  final String id;
  final bool isOwner;
  final int commentCount;
  final int likesCount;
  final bool isLiked;
  final bool isFavourite;

  const PostTopicModel({
    required this.tags,
    required this.title,
    this.content = "",
    required this.user,
    required this.topicId,
    required this.createdAt,
    required this.id,
    required this.isOwner,
    this.commentCount = 0,
    this.likesCount = 0,
    this.isLiked = false,
    this.isFavourite = false,
  });

  factory PostTopicModel.fromJson(Map<String, dynamic> json) =>
      _$PostTopicModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostTopicModelToJson(this);
}

extension PostTopicModelMapper on PostTopicModel {
  TopicPost toTopicPost() => TopicPost(
        tags: tags,
        title: title,
        user: user.toPostUser(),
        topicId: topicId,
        createdAt: createdAt,
        id: id,
        isOwner: isOwner,
        likeCount: likesCount,
        commentCount: commentCount,
        content: content,
        isLiked: isLiked,
        isFavourite: isFavourite,
      );
}
