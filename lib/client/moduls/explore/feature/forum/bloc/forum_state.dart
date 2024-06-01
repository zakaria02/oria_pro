part of 'forum_bloc.dart';

sealed class ForumState extends Equatable {
  const ForumState({
    required this.otherTopics,
    required this.recommondedTopics,
    required this.post,
    required this.posts,
  });

  final List<ForumTopic> otherTopics;
  final List<ForumTopic> recommondedTopics;
  final List<TopicPost> posts;
  final TopicPost? post;

  @override
  List<Object?> get props => [otherTopics, recommondedTopics, post, posts];
}

final class ForumInitial extends ForumState {
  const ForumInitial()
      : super(
          recommondedTopics: const [],
          otherTopics: const [],
          post: null,
          posts: const [],
        );
}

final class ForumTopicsLoading extends ForumState {
  const ForumTopicsLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
  });
}

final class ForumTopicsSuccess extends ForumState {
  const ForumTopicsSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
  });
}

final class TopicPostsLoading extends ForumState {
  const TopicPostsLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
  });
}

final class TopicPostsSuccess extends ForumState {
  const TopicPostsSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
  });
}

final class TopicPostDetailsLoading extends ForumState {
  const TopicPostDetailsLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
  });
}

final class TopicPostDetailsSuccess extends ForumState {
  const TopicPostDetailsSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
  });
}

final class AddPostLoading extends ForumState {
  const AddPostLoading({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
  });
}

final class AddPostSuccess extends ForumState {
  const AddPostSuccess({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
  });
}

final class ForumError extends ForumState {
  final String errorMessage;
  const ForumError({
    required super.recommondedTopics,
    required super.otherTopics,
    required super.post,
    required super.posts,
    required this.errorMessage,
  });
}
