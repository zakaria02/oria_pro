import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/topic_post.dart';
import 'package:oria_pro/utils/constants/oria_links.dart';

part 'topic_post_model.g.dart';

@JsonSerializable()
class PostTopicModelResults {
  final List<PostTopicModel> results;

  const PostTopicModelResults({
    required this.results,
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
  final int likeCount;

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
    this.likeCount = 0,
  });

  factory PostTopicModel.fromJson(Map<String, dynamic> json) =>
      _$PostTopicModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostTopicModelToJson(this);
}

@JsonSerializable()
class PostUserModel {
  final String profilePicture;
  final String name;
  final String id;

  const PostUserModel({
    required this.profilePicture,
    required this.name,
    required this.id,
  });

  factory PostUserModel.fromJson(Map<String, dynamic> json) =>
      _$PostUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostUserModelToJson(this);
}

extension PostTopicModelMapper on PostTopicModel {
  TopicPost toTopicPost() => TopicPost(
        tags: tags,
        title: title,
        user: PostUser(
          profilePicture:
              "${OriaLinks.stagingProfileAssetsBaseUrl}/${user.profilePicture}",
          name: user.name,
          id: user.id,
        ),
        topicId: topicId,
        createdAt: createdAt,
        id: id,
        isOwner: isOwner,
        likeCount: likeCount,
        commentCount: commentCount,
        content: content,
      );
}
