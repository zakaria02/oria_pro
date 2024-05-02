import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/tracked_symptom_model.dart';

part 'symptom_tracker_service.g.dart';

@RestApi()
abstract class SymptomTrackerService {
  factory SymptomTrackerService(Dio dio, {String baseUrl}) =
      _SymptomTrackerService;
  @GET("/tracker/tracked/symptoms")
  Future<List<TrackedSymptomModel>> fetchTrackedSymptoms();
}
