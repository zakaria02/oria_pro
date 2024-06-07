part of 'forum_bloc.dart';

sealed class ForumEvent extends Equatable {
  const ForumEvent();

  @override
  List<Object> get props => [];
}

final class FetchTopics extends ForumEvent {}

final class FetchTopicPosts extends ForumEvent {
  final ForumTopic topic;

  const FetchTopicPosts({required this.topic});
}

final class FetchPostDetails extends ForumEvent {
  final TopicPost post;

  const FetchPostDetails({required this.post});
}

final class AddPost extends ForumEvent {
  final ForumTopic topic;
  final String title;
  final String content;
  final List<String> tags;

  const AddPost({
    required this.topic,
    required this.title,
    required this.content,
    required this.tags,
  });
}

final class DeletePost extends ForumEvent {
  final ForumTopic topic;
  final TopicPost post;

  const DeletePost({
    required this.topic,
    required this.post,
  });
}

final class UpdatePost extends ForumEvent {
  final ForumTopic topic;
  final TopicPost post;
  final String title;
  final String content;
  final List<String> tags;

  const UpdatePost({
    required this.topic,
    required this.post,
    required this.title,
    required this.content,
    required this.tags,
  });
}

final class AddComment extends ForumEvent {
  final ForumTopic topic;
  final TopicPost post;
  final String comment;
  final String? parentId;

  const AddComment({
    required this.topic,
    required this.post,
    required this.comment,
    this.parentId,
  });
}
