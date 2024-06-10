import 'package:dio/dio.dart';
import 'package:oria_pro/client/moduls/explore/business/model/add_forum_post_request_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/enroll_program_request_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/learning_article.dart';
import 'package:oria_pro/client/moduls/explore/business/model/symptom_programs_model.dart';
import 'package:retrofit/retrofit.dart';
import '../model/add_comment_request_model.dart';
import '../model/comment_model.dart';
import '../model/explore_symptom_article_model.dart';
import '../model/explore_symptom_program_model.dart';
import '../model/favorite_request_model.dart';
import '../model/forum_topic_model.dart';
import '../model/program_model.dart';
import '../model/topic_post_model.dart';
import '../model/update_section_request_model.dart';
import '../model/update_section_response_model.dart';

part 'explore_service.g.dart';

@RestApi()
abstract class ExploreService {
  factory ExploreService(Dio dio, {String baseUrl}) = _ExploreService;
  @GET("/learning/articles/explorer")
  Future<List<ExploreSymptomArticleModel>> fetchExploreArticles();

  @GET("/learning/programs/explorer")
  Future<List<ExploreSymptomProgramModel>> fetchExplorePrograms();

  @GET("/learning/article/{articleId}")
  Future<LearningArticleModel> fetchArticleContent(@Path() String articleId);

  @POST("/users/favourite")
  Future<void> addFavorite(@Body() FavoriteRequestModel request);

  @DELETE("/users/favourite")
  Future<void> removeFavorite(@Body() FavoriteRequestModel request);

  @GET("/learning/programs/{symptomId}")
  Future<SymptomProgramsResultModel> fetchSymptomPrograms(
    @Path() String symptomId,
  );

  @POST("/progress/program/enroll")
  Future<void> enrollProgram(@Body() EnrollProgramRequestModel request);

  @POST("/progress/program/reset")
  Future<void> resetProgram(@Body() EnrollProgramRequestModel request);

  @GET("/learning/program/{programId}")
  Future<ProgramModel> fetchProgram(
    @Path() String programId,
  );

  @POST("/progress/program/new")
  Future<void> updateSection(@Body() UpdateSectionRequestModel request);

  @GET("/learning/program/{programId}/section/{sectionId}")
  Future<ProgramSectionWithContentModel> fetchSectionDetails(
      @Path() String programId, @Path() String sectionId);

  @GET("/learning/program/{programId}/section/{sectionId}")
  Future<ProgramSectionWithContentModel> fetchProgramSectionContent(
    @Path() String programId,
    @Path() String sectionId,
  );

  @GET("/forum/topics")
  Future<List<ForumTopicModel>> fetchForumTopics();

  @GET("/forum/topics/{topicId}/posts")
  Future<List<PostTopicModel>> fetchTopicPosts(@Path() String topicId);

  @GET("/forum/posts/{postId}")
  Future<PostTopicModel> fetchPostDetails(@Path() String postId);

  @POST("/forum/topics/{topicId}/posts")
  Future<void> addTopicPost(
    @Path() String topicId,
    @Body() AddForumPostRequestModel request,
  );

  @DELETE("/forum/posts/{topicId}")
  Future<void> deleteTopicPost(@Path() String topicId);

  @PUT("/forum/posts/{topicId}")
  Future<void> updateTopicPost(
    @Path() String topicId,
    @Body() AddForumPostRequestModel request,
  );

  @POST("/forum/posts/{postId}/comments")
  Future<CommentModel> addComment(
    @Path() String postId,
    @Body() AddCommentRequestModel request,
  );

  @PUT("/forum/comments/{commentId}")
  Future<CommentModel> updateComment(
    @Path() String commentId,
    @Body() AddCommentRequestModel request,
  );

  @DELETE("/forum/comments/{commentId}")
  Future<void> deleteComment(
    @Path() String commentId,
  );

  @GET("/forum/posts/{postId}/comments")
  Future<List<CommentModel>> fetchPostComment(
    @Path() String postId,
  );

  @POST("/forum/posts/{postId}/like")
  Future<void> likePost(
    @Path() String postId,
  );

  @POST("/forum/posts/{postId}/unlike")
  Future<void> unlikePost(
    @Path() String postId,
  );

  @POST("/forum/posts/{postId}/favourite")
  Future<void> favoritePost(
    @Path() String postId,
  );

  @POST("/forum/posts/{postId}/unfavourite")
  Future<void> unFavoritePost(
    @Path() String postId,
  );
}
