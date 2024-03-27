import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/symptom_info_model.dart';
import '../model/symptom_severity_request_model.dart';
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

  @GET("/metadata/symptoms")
  Future<List<SymptomInfoModel>> fetchAllSymptoms();

  @POST("/tracker/track/symptom/event")
  Future<void> addSymptomSeverity(@Body() SymptomSeverityRequestModel request);
}
