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
