import 'package:dio/dio.dart';
import 'package:oria_pro/common/symptoms/business/model/delete_symptom_request_model.dart';
import 'package:retrofit/retrofit.dart';

import '../model/set_todays_actions_request.dart';
import '../model/symptom_content_model.dart';
import '../model/symptom_info_model.dart';
import '../model/symptom_severity_request_model.dart';
import '../model/todays_action_programs_response.dart';
import '../model/user_symptom_model.dart';
import '../model/user_symptom_request_model.dart';
import '../model/user_symptom_response_model.dart';

part 'symptom_service.g.dart';

@RestApi()
abstract class SymptomService {
  factory SymptomService(Dio dio, {String baseUrl}) = _SymptomService;

  @GET("/users/user-symptoms")
  Future<List<UserSymptomModel>> fetchUserSymptoms();

  @POST("/users/user-symptom")
  Future<List<UserSymptomResponseModel>> addUserSymptom(
      @Body() UserSymptomRequestModel request);

  @DELETE("/users/user-symptom")
  Future<void> deleteUserSymptom(@Body() DeleteSymptomRequestModel request);

  @GET("/metadata/symptoms")
  Future<List<SymptomInfoModel>> fetchAllSymptoms();

  @POST("/tracker/track/symptom/event")
  Future<void> addSymptomSeverity(@Body() SymptomSeverityRequestModel request);

  @GET("/learning/symptom-explore/{symptomId}")
  Future<SymptomContentModel> getSymptomContent(@Path() String symptomId);

  @POST("/users/set-active-program")
  Future<void> setTodaysActionsProgram(@Body() SetTodaysActionsProgram request);

  @GET("/learning/daily-actions/get-programs")
  Future<TodaysActionProgramsResponse> getTodayActionsProgram();
}
