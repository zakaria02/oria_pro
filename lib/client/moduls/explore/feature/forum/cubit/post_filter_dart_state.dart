part of 'post_filter_dart_cubit.dart';

class PostFilterState extends Equatable {
  const PostFilterState({
    required this.posts,
    required this.filter,
  });
  final List<TopicPost> posts;
  final FilterType filter;

  @override
  List<Object> get props => [posts, filter];
}
