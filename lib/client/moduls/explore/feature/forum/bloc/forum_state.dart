part of 'forum_bloc.dart';

sealed class ForumState extends Equatable {
  const ForumState({
    required this.otherTopics,
    required this.recommondedTopics,
    required this.post,
    required this.posts,
    required this.comments,
    required this.currentPage,
    required this.totalPages,
  });

  final List<ForumTopic> otherTopics;
  final List<ForumTopic> recommondedTopics;
  final List<TopicPost> posts;
  final TopicPost? post;
  final List<Comment> comments;
  final int currentPage;
  final int totalPages;

  @override
  List<Object?> get props => [
        otherTopics,
        recommondedTopics,
        post,
        posts,
        comments,
        currentPage,
        totalPages
      ];
}

final class ForumInitial extends ForumState {
  const ForumInitial()
      : super(
          recommondedTopics: const [],
          otherTopics: const [],
          post: null,
          posts: const [],
          comments: const [],
          currentPage: 0,
          totalPages: 1,
        );
}

final class ForumTopicsLoading extends ForumState {
  const ForumTopicsLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class ForumTopicsSuccess extends ForumState {
  const ForumTopicsSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class TopicPostsLoading extends ForumState {
  const TopicPostsLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class TopicPostsSuccess extends ForumState {
  const TopicPostsSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class TopicPostDetailsLoading extends ForumState {
  const TopicPostDetailsLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class TopicPostDetailsSuccess extends ForumState {
  const TopicPostDetailsSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class AddPostLoading extends ForumState {
  const AddPostLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class AddPostSuccess extends ForumState {
  const AddPostSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class UpdatePostLoading extends ForumState {
  const UpdatePostLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class UpdatePostSuccess extends ForumState {
  const UpdatePostSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class DeletePostLoading extends ForumState {
  const DeletePostLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class DeletePostSuccess extends ForumState {
  const DeletePostSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class CommentLoading extends ForumState {
  const CommentLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class CommentSuccess extends ForumState {
  const CommentSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class LikeLoading extends ForumState {
  const LikeLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class LikeSuccess extends ForumState {
  const LikeSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class FavoriteLoading extends ForumState {
  const FavoriteLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class FavoriteSuccess extends ForumState {
  const FavoriteSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class ComplainLoading extends ForumState {
  const ComplainLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
  });
}

final class ComplainSuccess extends ForumState {
  const ComplainSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required super.comments,
    required super.currentPage,
    required super.totalPages,
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
    required super.currentPage,
    required super.totalPages,
    required this.errorMessage,
  });
}
