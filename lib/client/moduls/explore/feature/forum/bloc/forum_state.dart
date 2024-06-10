part of 'forum_bloc.dart';

sealed class ForumState extends Equatable {
  const ForumState({
    required this.otherTopics,
    required this.recommondedTopics,
    required this.post,
    required this.posts,
    required this.comments,
  });

  final List<ForumTopic> otherTopics;
  final List<ForumTopic> recommondedTopics;
  final List<TopicPost> posts;
  final TopicPost? post;
  final List<Comment> comments;

  @override
  List<Object?> get props =>
      [otherTopics, recommondedTopics, post, posts, comments];
}

final class ForumInitial extends ForumState {
  const ForumInitial()
      : super(
          recommondedTopics: const [],
          otherTopics: const [],
          post: null,
          posts: const [],
          comments: const [],
        );
}

final class ForumTopicsLoading extends ForumState {
  const ForumTopicsLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
  });
}

final class ForumTopicsSuccess extends ForumState {
  const ForumTopicsSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
  });
}

final class TopicPostsLoading extends ForumState {
  const TopicPostsLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
  });
}

final class TopicPostsSuccess extends ForumState {
  const TopicPostsSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
  });
}

final class TopicPostDetailsLoading extends ForumState {
  const TopicPostDetailsLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
  });
}

final class TopicPostDetailsSuccess extends ForumState {
  const TopicPostDetailsSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
  });
}

final class AddPostLoading extends ForumState {
  const AddPostLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
  });
}

final class AddPostSuccess extends ForumState {
  const AddPostSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
  });
}

final class UpdatePostLoading extends ForumState {
  const UpdatePostLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
  });
}

final class UpdatePostSuccess extends ForumState {
  const UpdatePostSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
  });
}

final class DeletePostLoading extends ForumState {
  const DeletePostLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
  });
}

final class DeletePostSuccess extends ForumState {
  const DeletePostSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
  });
}

final class CommentLoading extends ForumState {
  const CommentLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
  });
}

final class CommentSuccess extends ForumState {
  const CommentSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
  });
}

final class LikeLoading extends ForumState {
  const LikeLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
  });
}

final class LikeSuccess extends ForumState {
  const LikeSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
  });
}

final class FavoriteLoading extends ForumState {
  const FavoriteLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
  });
}

final class FavoriteSuccess extends ForumState {
  const FavoriteSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
  });
}

final class ForumError extends ForumState {
  final String errorMessage;
  const ForumError({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required this.errorMessage,
  });
}
