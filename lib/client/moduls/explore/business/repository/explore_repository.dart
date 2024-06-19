import 'package:oria_pro/client/moduls/explore/business/model/complain_request_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/enroll_program_request_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/learning_article.dart';
import 'package:oria_pro/client/moduls/explore/business/model/update_section_request_model.dart';

import '../di/explore_locator.dart';
import '../model/add_comment_request_model.dart';
import '../model/add_forum_post_request_model.dart';
import '../model/comment_model.dart';
import '../model/explore_symptom_article_model.dart';
import '../model/explore_symptom_program_model.dart';
import '../model/forum_topic_model.dart';
import '../model/program_model.dart';
import '../model/symptom_programs_model.dart';
import '../model/topic_post_model.dart';
import '../model/update_section_response_model.dart';
import '../service/explore_service.dart';

abstract class ExploreRepository {
  Future<List<ExploreSymptomArticleModel>> fetchExploreArticles();
  Future<List<ExploreSymptomProgramModel>> fetchExplorePrograms();
  Future<LearningArticleModel> fetchArticleContent(
    String articleId,
  );
  Future<SymptomProgramsResultModel> fetchSymptomPrograms(String symptomId);
  Future<void> enrollProgram(String programId);
  Future<void> resetProgram(String programId);
  Future<ProgramModel> fetchProgram(String programId);
  Future<void> updateSection(UpdateSectionRequestModel request);
  Future<ProgramSectionWithContentModel> fetchSectionDetails(
      String programId, String sectionId);
  Future<List<ForumTopicModel>> fetchForumTopics();
  Future<List<PostTopicModel>> fetchTopicPosts(String topicId);
  Future<PostTopicModel> fetchPostDetails(String postId);
  Future<void> addTopicPost(String topicId, AddForumPostRequestModel request);
  Future<List<CommentModel>> fetchPostComment(String postId);
  Future<CommentModel> addComment(
      String postId, AddCommentRequestModel request);
  Future<void> deleteTopicPost(String topicId);
  Future<void> updateTopicPost(
      String topicId, AddForumPostRequestModel request);
  Future<void> likePost(String postId);
  Future<void> unlikePost(String postId);
  Future<void> likeComment(String commentId);
  Future<void> unlikeComment(String commentId);
  Future<void> favoritePost(String postId);
  Future<void> unFavoritePost(String postId);
  Future<CommentModel> updateComment(
      String commentId, AddCommentRequestModel request);
  Future<void> deleteComment(String commentId);
  Future<void> complainPost(String postId);
  Future<void> complainComment(String commentId);
}

class ExploreRepositoryImpl extends ExploreRepository {
  ExploreService service = ExploreLocator().get();

  @override
  Future<List<ExploreSymptomArticleModel>> fetchExploreArticles() async {
    return service.fetchExploreArticles();
  }

  @override
  Future<List<ExploreSymptomProgramModel>> fetchExplorePrograms() async {
    return service.fetchExplorePrograms();
  }

  @override
  Future<LearningArticleModel> fetchArticleContent(String articleId) {
    return service.fetchArticleContent(articleId);
  }

  @override
  Future<SymptomProgramsResultModel> fetchSymptomPrograms(String symptomId) {
    return service.fetchSymptomPrograms(symptomId);
  }

  @override
  Future<void> enrollProgram(String programId) {
    return service
        .enrollProgram(EnrollProgramRequestModel(programId: programId));
  }

  @override
  Future<ProgramModel> fetchProgram(String programId) {
    return service.fetchProgram(programId);
  }

  @override
  Future<void> updateSection(UpdateSectionRequestModel request) {
    return service.updateSection(request);
  }

  @override
  Future<ProgramSectionWithContentModel> fetchSectionDetails(
      String programId, String sectionId) {
    return service.fetchSectionDetails(programId, sectionId);
  }

  @override
  Future<void> resetProgram(String programId) {
    return service
        .resetProgram(EnrollProgramRequestModel(programId: programId));
  }

  @override
  Future<List<ForumTopicModel>> fetchForumTopics() {
    return service.fetchForumTopics();
  }

  @override
  Future<void> addTopicPost(String topicId, AddForumPostRequestModel request) {
    return service.addTopicPost(topicId, request);
  }

  @override
  Future<PostTopicModel> fetchPostDetails(String postId) {
    return service.fetchPostDetails(postId);
  }

  @override
  Future<List<PostTopicModel>> fetchTopicPosts(String topicId) {
    return service.fetchTopicPosts(topicId);
  }

  @override
  Future<List<CommentModel>> fetchPostComment(String postId) {
    return service.fetchPostComment(postId);
  }

  @override
  Future<CommentModel> addComment(
      String postId, AddCommentRequestModel request) {
    return service.addComment(postId, request);
  }

  @override
  Future<void> deleteTopicPost(String topicId) {
    return service.deleteTopicPost(topicId);
  }

  @override
  Future<void> updateTopicPost(
      String topicId, AddForumPostRequestModel request) {
    return service.updateTopicPost(topicId, request);
  }

  @override
  Future<void> deleteComment(String commentId) {
    return service.deleteComment(commentId);
  }

  @override
  Future<void> favoritePost(String postId) {
    return service.favoritePost(postId);
  }

  @override
  Future<void> likePost(String postId) {
    return service.likePost(postId);
  }

  @override
  Future<void> unFavoritePost(String postId) {
    return service.unFavoritePost(postId);
  }

  @override
  Future<void> unlikePost(String postId) {
    return service.unlikePost(postId);
  }

  @override
  Future<CommentModel> updateComment(
      String commentId, AddCommentRequestModel request) {
    return service.updateComment(commentId, request);
  }

  @override
  Future<void> complainComment(String commentId) {
    return service
        .complainComment(ComplainCommentRequestModel(commentId: commentId));
  }

  @override
  Future<void> complainPost(String postId) {
    return service.complainPost(ComplainPostRequestModel(postId: postId));
  }

  @override
  Future<void> likeComment(String commentId) {
    return service.likeComment(commentId);
  }

  @override
  Future<void> unlikeComment(String commentId) {
    return service.unlikeComment(commentId);
  }
}
