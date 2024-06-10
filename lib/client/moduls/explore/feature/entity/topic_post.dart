import 'post_user.dart';

class TopicPost {
  final List<String> tags;
  final String title;
  final String content;
  final PostUser user;
  final String topicId;
  final DateTime createdAt;
  final String id;
  final bool isOwner;
  final int commentCount;
  final int likeCount;
  final bool isLiked;
  final bool isFavourite;

  const TopicPost({
    required this.tags,
    required this.title,
    this.content = "",
    required this.user,
    required this.topicId,
    required this.createdAt,
    required this.id,
    required this.isOwner,
    required this.commentCount,
    required this.likeCount,
    required this.isLiked,
    required this.isFavourite,
  });

  TopicPost copyWith({
    List<String>? tags,
    String? title,
    String? content,
    PostUser? user,
    String? topicId,
    DateTime? createdAt,
    String? id,
    bool? isOwner,
    int? commentCount,
    int? likeCount,
    bool? isLiked,
    bool? isFavourite,
  }) {
    return TopicPost(
      tags: tags ?? this.tags,
      title: title ?? this.title,
      content: content ?? this.content,
      user: user ?? this.user,
      topicId: topicId ?? this.topicId,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      isOwner: isOwner ?? this.isOwner,
      commentCount: commentCount ?? this.commentCount,
      likeCount: likeCount ?? this.likeCount,
      isLiked: isLiked ?? this.isLiked,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}
