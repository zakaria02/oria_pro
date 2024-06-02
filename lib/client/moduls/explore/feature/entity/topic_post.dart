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
  });
}
