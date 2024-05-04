import 'package:dio/dio.dart';
import 'package:oria_pro/client/moduls/tracker/business/model/activity_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../model/add_symptom_activity_model.dart';
import '../model/add_symptom_severity_model.dart';
import '../model/tracked_symptom_model.dart';

part 'symptom_tracker_service.g.dart';

@RestApi()
abstract class SymptomTrackerService {
  factory SymptomTrackerService(Dio dio, {String baseUrl}) =
      _SymptomTrackerService;
  @GET("/tracker/symptoms/home")
  Future<List<TrackedSymptomModel>> fetchTrackedSymptoms();

  @POST("/tracker/track/symptom/event")
  Future<void> addSymptomSeverity(@Body() AddSymptomSeverityModel request);

  @POST("/tracker/symptoms/event/activity")
  Future<void> addSymptomActivity(@Body() AddSymptomActivityModel request);

  @DELETE("/tracker/symptoms/event/activity")
  Future<void> removeSymptomActivity(@Query("logEventId") String logEventId,
      @Query("activityId") String activityId);

  @GET("/metadata/activities")
  Future<List<ActivityModel>> fetchActivities();
}
