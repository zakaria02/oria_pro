import 'package:oria_pro/client/moduls/explore/business/model/enroll_program_request_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/learning_article.dart';
import 'package:oria_pro/client/moduls/explore/business/model/update_section_request_model.dart';

import '../di/explore_locator.dart';
import '../model/add_forum_post_request_model.dart';
import '../model/explore_symptom_article_model.dart';
import '../model/explore_symptom_program_model.dart';
import '../model/favorite_request_model.dart';
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
  Future<void> addFavorite(FavoriteRequestModel request);
  Future<void> removeFavorite(FavoriteRequestModel request);
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
  Future<void> addFavorite(FavoriteRequestModel request) {
    return service.addFavorite(request);
  }

  @override
  Future<void> removeFavorite(FavoriteRequestModel request) {
    return service.removeFavorite(request);
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
  Future<List<PostTopicModel>> fetchTopicPosts(String topicId) async {
    return (await service.fetchTopicPosts(topicId)).results;
  }
}
