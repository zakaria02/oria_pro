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
  final bool isOwner;
  final bool subVisible;

  const Comment({
    required this.parentId,
    required this.comment,
    required this.user,
    required this.postId,
    required this.createdAt,
    required this.id,
    required this.subComments,
    required this.likeCount,
    required this.isOwner,
    this.subVisible = false,
  });

  Comment copyWith({
    String? parentId,
    String? comment,
    PostUser? user,
    String? postId,
    DateTime? createdAt,
    String? id,
    List<Comment>? subComments,
    int? likeCount,
    bool? isOwner,
    bool? subVisible,
  }) {
    return Comment(
      parentId: parentId ?? this.parentId,
      comment: comment ?? this.comment,
      user: user ?? this.user,
      postId: postId ?? this.postId,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      subComments: subComments ?? this.subComments,
      likeCount: likeCount ?? this.likeCount,
      isOwner: isOwner ?? this.isOwner,
      subVisible: subVisible ?? this.subVisible,
    );
  }

  int get totalComments => _countComments(this);

  int _countComments(Comment comment) {
    int count = 1; // Count the comment itself
    for (var subComment in comment.subComments) {
      count += _countComments(subComment);
    }
    return count;
  }

  static int getTotalCommentsForList(List<Comment> comments) {
    int total = 0;
    for (var comment in comments) {
      total += comment.totalComments;
    }
    return total;
  }
}
