import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/explore/business/di/explore_locator.dart';
import 'package:oria_pro/client/moduls/explore/business/model/add_forum_post_request_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/forum_topic_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/topic_post_model.dart';
import 'package:oria_pro/client/moduls/explore/business/repository/explore_repository.dart';

import '../../entity/forum_topic.dart';
import '../../entity/topic_post.dart';

part 'forum_event.dart';
part 'forum_state.dart';

class ForumBloc extends Bloc<ForumEvent, ForumState> {
  ForumBloc() : super(const ForumInitial()) {
    on<FetchTopics>((event, emit) async {
      final ExploreRepository repository = ExploreLocator().get();
      try {
        emit(ForumTopicsLoading(
          recommondedTopics: state.recommondedTopics,
          otherTopics: state.otherTopics,
          post: state.post,
          posts: state.posts,
        ));
        final topicsModel = await repository.fetchForumTopics();
        emit(
          ForumTopicsSuccess(
            otherTopics: topicsModel
                .where((topic) => !topic.isRecommended)
                .map((topic) => topic.toForumTopic())
                .toList(),
            recommondedTopics: topicsModel
                .where((topic) => topic.isRecommended)
                .map((topic) => topic.toForumTopic())
                .toList(),
            post: state.post,
            posts: state.posts,
          ),
        );
      } catch (e) {
        emit(ForumError(
          otherTopics: state.otherTopics,
          post: state.post,
          posts: state.posts,
          recommondedTopics: state.recommondedTopics,
          errorMessage: e.toString(),
        ));
      }
    });

    on<FetchTopicPosts>((event, emit) async {
      final ExploreRepository repository = ExploreLocator().get();
      try {
        emit(
          TopicPostsLoading(
            recommondedTopics: state.recommondedTopics,
            otherTopics: state.otherTopics,
            post: state.post,
            posts: state.posts,
          ),
        );
        final postsModel = await repository.fetchTopicPosts(event.topic.id);
        emit(
          TopicPostsSuccess(
            otherTopics: state.otherTopics,
            recommondedTopics: state.recommondedTopics,
            post: state.post,
            posts: postsModel.map((post) => post.toTopicPost()).toList(),
          ),
        );
      } catch (e) {
        emit(ForumError(
          otherTopics: state.otherTopics,
          post: state.post,
          posts: state.posts,
          recommondedTopics: state.recommondedTopics,
          errorMessage: e.toString(),
        ));
      }
    });

    on<FetchPostDetails>((event, emit) async {
      final ExploreRepository repository = ExploreLocator().get();
      try {
        emit(
          TopicPostDetailsLoading(
            recommondedTopics: state.recommondedTopics,
            otherTopics: state.otherTopics,
            post: state.post,
            posts: state.posts,
          ),
        );
        final postModel = await repository.fetchPostDetails(event.post.id);
        emit(
          TopicPostDetailsSuccess(
            otherTopics: state.otherTopics,
            recommondedTopics: state.recommondedTopics,
            post: postModel.toTopicPost(),
            posts: state.posts,
          ),
        );
      } catch (e) {
        emit(ForumError(
          otherTopics: state.otherTopics,
          post: state.post,
          posts: state.posts,
          recommondedTopics: state.recommondedTopics,
          errorMessage: e.toString(),
        ));
      }
    });

    on<AddPost>((event, emit) async {
      final ExploreRepository repository = ExploreLocator().get();
      try {
        emit(
          AddPostLoading(
            recommondedTopics: state.recommondedTopics,
            otherTopics: state.otherTopics,
            post: state.post,
            posts: state.posts,
          ),
        );
        await repository.addTopicPost(
          event.topic.id,
          AddForumPostRequestModel(
            title: event.title,
            content: event.content,
            tags: event.tags,
          ),
        );
        emit(
          AddPostSuccess(
            otherTopics: state.otherTopics,
            recommondedTopics: state.recommondedTopics,
            post: state.post,
            posts: state.posts,
          ),
        );
        add(FetchTopicPosts(topic: event.topic));
        add(FetchTopics());
      } catch (e) {
        emit(ForumError(
          otherTopics: state.otherTopics,
          post: state.post,
          posts: state.posts,
          recommondedTopics: state.recommondedTopics,
          errorMessage: e.toString(),
        ));
      }
    });
  }
}
