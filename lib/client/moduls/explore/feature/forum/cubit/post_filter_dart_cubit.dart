import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../entity/topic_post.dart';

part 'post_filter_dart_state.dart';

class PostFilterCubit extends Cubit<PostFilterState> {
  PostFilterCubit(List<TopicPost> posts)
      : super(
          PostFilterState(
            posts: posts,
            filter: FilterType.mostRecent,
          ),
        );

  void addFilter(FilterType filter, List<TopicPost> initialPosts) {
    if (filter == FilterType.my) {
      emit(PostFilterState(
        filter: filter,
        posts: initialPosts.where((post) => post.isOwner).toList(),
      ));
    } else if (filter == FilterType.top) {
      initialPosts.sort((a, b) {
        int likeComparison = b.likeCount.compareTo(a.likeCount);
        if (likeComparison != 0) {
          return likeComparison;
        } else {
          return b.commentCount.compareTo(a.commentCount);
        }
      });
      emit(PostFilterState(
        filter: filter,
        posts: initialPosts,
      ));
    } else {
      emit(PostFilterState(
        filter: filter,
        posts: initialPosts.reversed.toList(),
      ));
    }
  }
}

enum FilterType {
  my,
  top,
  mostRecent,
}
