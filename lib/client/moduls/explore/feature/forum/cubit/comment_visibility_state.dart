part of 'comment_visibility_cubit.dart';

class CommentVisibilityState extends Equatable {
  const CommentVisibilityState({required this.commentsVisibilities});
  final List<CommentWithVisibility> commentsVisibilities;

  @override
  List<Object> get props => [commentsVisibilities];
}

final class CommentWithVisibility {
  final String commentId;
  final bool commentVisibility;

  const CommentWithVisibility({
    required this.commentId,
    required this.commentVisibility,
  });
}
