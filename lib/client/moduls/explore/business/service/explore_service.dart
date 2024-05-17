import 'package:dio/dio.dart';
import 'package:oria_pro/client/moduls/explore/business/model/enroll_program_request_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/learning_article.dart';
import 'package:oria_pro/client/moduls/explore/business/model/symptom_programs_model.dart';
import 'package:retrofit/retrofit.dart';
import '../model/explore_symptom_article_model.dart';
import '../model/explore_symptom_program_model.dart';
import '../model/favorite_request_model.dart';
import '../model/program_model.dart';
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
}
