import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/explore/business/di/explore_locator.dart';
import 'package:oria_pro/client/moduls/explore/business/model/add_comment_request_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/add_forum_post_request_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/comment_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/forum_topic_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/topic_post_model.dart';
import 'package:oria_pro/client/moduls/explore/business/repository/explore_repository.dart';

import '../../entity/comment.dart';
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
            comments: state.comments));
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
              comments: state.comments),
        );
      } catch (e) {
        emit(ForumError(
          otherTopics: state.otherTopics,
          post: state.post,
          posts: state.posts,
          comments: state.comments,
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
              comments: state.comments),
        );
        final postsModel = await repository.fetchTopicPosts(event.topic.id);
        emit(
          TopicPostsSuccess(
              otherTopics: state.otherTopics,
              recommondedTopics: state.recommondedTopics,
              post: state.post,
              posts: postsModel.map((post) => post.toTopicPost()).toList(),
              comments: state.comments),
        );
      } catch (e) {
        emit(ForumError(
          otherTopics: state.otherTopics,
          post: state.post,
          posts: state.posts,
          comments: state.comments,
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
              comments: state.comments),
        );
        final postModel = await repository.fetchPostDetails(event.post.id);
        final commentsModel = await repository.fetchPostComment(event.post.id);
        emit(
          TopicPostDetailsSuccess(
            otherTopics: state.otherTopics,
            recommondedTopics: state.recommondedTopics,
            post: postModel.toTopicPost(),
            posts: state.posts,
            comments: commentsModel.map((comm) => comm.toComment()).toList(),
          ),
        );
      } catch (e) {
        emit(ForumError(
          otherTopics: state.otherTopics,
          post: state.post,
          posts: state.posts,
          comments: state.comments,
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
              comments: state.comments),
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
              comments: state.comments),
        );
        add(FetchTopicPosts(topic: event.topic));
        add(FetchTopics());
      } catch (e) {
        emit(ForumError(
          otherTopics: state.otherTopics,
          post: state.post,
          posts: state.posts,
          comments: state.comments,
          recommondedTopics: state.recommondedTopics,
          errorMessage: e.toString(),
        ));
      }
    });

    on<UpdatePost>((event, emit) async {
      final ExploreRepository repository = ExploreLocator().get();
      try {
        emit(
          UpdatePostLoading(
              recommondedTopics: state.recommondedTopics,
              otherTopics: state.otherTopics,
              post: state.post,
              posts: state.posts,
              comments: state.comments),
        );
        await repository.updateTopicPost(
          event.post.id,
          AddForumPostRequestModel(
            title: event.title,
            content: event.content,
            tags: event.tags,
          ),
        );
        emit(
          UpdatePostSuccess(
              otherTopics: state.otherTopics,
              recommondedTopics: state.recommondedTopics,
              post: state.post,
              posts: state.posts,
              comments: state.comments),
        );
        add(FetchTopicPosts(topic: event.topic));
        add(FetchTopics());
      } catch (e) {
        emit(ForumError(
          otherTopics: state.otherTopics,
          post: state.post,
          posts: state.posts,
          comments: state.comments,
          recommondedTopics: state.recommondedTopics,
          errorMessage: e.toString(),
        ));
      }
    });

    on<DeletePost>((event, emit) async {
      final ExploreRepository repository = ExploreLocator().get();
      try {
        emit(
          DeletePostLoading(
              recommondedTopics: state.recommondedTopics,
              otherTopics: state.otherTopics,
              post: state.post,
              posts: state.posts,
              comments: state.comments),
        );
        await repository.deleteTopicPost(event.post.id);
        emit(DeletePostSuccess(
          recommondedTopics: state.recommondedTopics,
          otherTopics: state.otherTopics,
          post: state.post,
          posts: state.posts,
          comments: state.comments,
        ));
        add(FetchTopicPosts(topic: event.topic));
        add(FetchTopics());
      } catch (e) {
        emit(ForumError(
          otherTopics: state.otherTopics,
          post: state.post,
          posts: state.posts,
          comments: state.comments,
          recommondedTopics: state.recommondedTopics,
          errorMessage: e.toString(),
        ));
      }
    });

    on<AddComment>((event, emit) async {
      final ExploreRepository repository = ExploreLocator().get();
      try {
        emit(
          CommentLoading(
              recommondedTopics: state.recommondedTopics,
              otherTopics: state.otherTopics,
              post: state.post,
              posts: state.posts,
              comments: state.comments),
        );
        final commentModel = await repository.addComment(
          event.post.id,
          AddCommentRequestModel(
            comment: event.comment,
            parentId: event.parentId,
          ),
        );
        List<Comment> comments = state.comments;
        if (event.parentId == null) {
          comments.add(commentModel.toComment(owner: true));
        } else {
          comments
              .firstWhere((comm) => comm.id == commentModel.parentId)
              .subComments
              .add(commentModel.toComment(owner: true));
        }
        emit(
          CommentSuccess(
            otherTopics: state.otherTopics,
            recommondedTopics: state.recommondedTopics,
            post: state.post,
            posts: state.posts,
            comments: comments,
          ),
        );
      } catch (e) {
        emit(ForumError(
          otherTopics: state.otherTopics,
          post: state.post,
          posts: state.posts,
          comments: state.comments,
          recommondedTopics: state.recommondedTopics,
          errorMessage: e.toString(),
        ));
      }
    });

    on<UpdateComment>((event, emit) async {
      final ExploreRepository repository = ExploreLocator().get();
      try {
        emit(
          CommentLoading(
              recommondedTopics: state.recommondedTopics,
              otherTopics: state.otherTopics,
              post: state.post,
              posts: state.posts,
              comments: state.comments),
        );
        final commentModel = await repository.updateComment(
          event.currentComment.id,
          AddCommentRequestModel(
            comment: event.comment,
          ),
        );
        List<Comment> comments = state.comments;
        if (commentModel.parentId == null) {
          for (int i = 0; i < comments.length; i++) {
            if (comments[i].id == commentModel.id) {
              comments[i] = commentModel.toComment();
              break;
            }
          }
        } else {
          for (int i = 0; i < comments.length; i++) {
            for (int i = 0; i < comments[i].subComments.length; i++) {
              if (comments[i].subComments[i].id == event.currentComment.id) {
                comments[i].subComments[i] = commentModel.toComment();
                break;
              }
            }
          }
        }
        emit(
          CommentSuccess(
            otherTopics: state.otherTopics,
            recommondedTopics: state.recommondedTopics,
            post: state.post,
            posts: state.posts,
            comments: comments,
          ),
        );
      } catch (e) {
        emit(ForumError(
          otherTopics: state.otherTopics,
          post: state.post,
          posts: state.posts,
          comments: state.comments,
          recommondedTopics: state.recommondedTopics,
          errorMessage: e.toString(),
        ));
      }
    });

    on<DeleteComment>((event, emit) async {
      final ExploreRepository repository = ExploreLocator().get();
      try {
        emit(
          CommentLoading(
              recommondedTopics: state.recommondedTopics,
              otherTopics: state.otherTopics,
              post: state.post,
              posts: state.posts,
              comments: state.comments),
        );
        await repository.deleteComment(
          event.comment.id,
        );
        List<Comment> comments = state.comments;
        if (event.comment.parentId != null) {
          comments
              .firstWhere((comm) => comm.id == event.comment.parentId)
              .subComments
              .removeWhere((comm) => comm.id == event.comment.id);
        } else {
          comments.removeWhere((comm) => comm.id == event.comment.id);
        }
        emit(
          CommentSuccess(
            otherTopics: state.otherTopics,
            recommondedTopics: state.recommondedTopics,
            post: state.post,
            posts: state.posts,
            comments: comments,
          ),
        );
      } catch (e) {
        emit(ForumError(
          otherTopics: state.otherTopics,
          post: state.post,
          posts: state.posts,
          comments: state.comments,
          recommondedTopics: state.recommondedTopics,
          errorMessage: e.toString(),
        ));
      }
    });

    on<LikePost>((event, emit) async {
      final ExploreRepository repository = ExploreLocator().get();
      try {
        emit(
          LikeLoading(
              recommondedTopics: state.recommondedTopics,
              otherTopics: state.otherTopics,
              post: state.post,
              posts: state.posts,
              comments: state.comments),
        );
        if (state.post?.isLiked == true) {
          await repository.unlikePost(event.post.id);
        } else {
          await repository.likePost(event.post.id);
        }
        emit(
          LikeSuccess(
            otherTopics: state.otherTopics,
            recommondedTopics: state.recommondedTopics,
            post: state.post?.copyWith(
              likeCount: state.post?.isLiked == true
                  ? (state.post?.likeCount ?? 0) - 1
                  : (state.post?.likeCount ?? 0) + 1,
              isLiked: state.post?.isLiked == true ? false : true,
            ),
            posts: state.posts,
            comments: state.comments,
          ),
        );
      } catch (e) {
        emit(ForumError(
          otherTopics: state.otherTopics,
          post: state.post,
          posts: state.posts,
          comments: state.comments,
          recommondedTopics: state.recommondedTopics,
          errorMessage: e.toString(),
        ));
      }
    });

    on<FavoritePost>((event, emit) async {
      final ExploreRepository repository = ExploreLocator().get();
      late final bool favorite;
      try {
        emit(
          FavoriteLoading(
              recommondedTopics: state.recommondedTopics,
              otherTopics: state.otherTopics,
              post: state.post,
              posts: state.posts,
              comments: state.comments),
        );
        if (state.post?.isFavourite == true) {
          await repository.unFavoritePost(event.post.id);
          favorite = false;
        } else {
          await repository.favoritePost(event.post.id);
          favorite = true;
        }
        emit(
          FavoriteSuccess(
            otherTopics: state.otherTopics,
            recommondedTopics: state.recommondedTopics,
            post: state.post?.copyWith(isFavourite: favorite),
            posts: state.posts,
            comments: state.comments,
          ),
        );
      } catch (e) {
        emit(ForumError(
          otherTopics: state.otherTopics,
          post: state.post,
          posts: state.posts,
          comments: state.comments,
          recommondedTopics: state.recommondedTopics,
          errorMessage: e.toString(),
        ));
      }
    });
  }
}
