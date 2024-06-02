import 'post_user.dart';

class Comment {
  final String? parentId;
  final String comment;
  final PostUser user;
  final String postId;
  final DateTime createdAt;
  final String id;
  final List<Comment> subComments;
  final int likeCount;

  const Comment({
    required this.parentId,
    required this.comment,
    required this.user,
    required this.postId,
    required this.createdAt,
    required this.id,
    required this.subComments,
    required this.likeCount,
  });
}
