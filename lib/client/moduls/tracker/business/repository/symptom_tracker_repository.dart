import 'package:oria_pro/client/moduls/tracker/business/locator/tracker_locator.dart';
import 'package:oria_pro/client/moduls/tracker/business/service/symptom_tracker_service.dart';

import '../model/activity_model.dart';
import '../model/add_symptom_activity_model.dart';
import '../model/add_symptom_severity_model.dart';
import '../model/tracked_symptom_model.dart';

abstract class SymptomTrackerRepository {
  Future<List<TrackedSymptomModel>> fetchTrackedSymptoms();
  Future<void> addSymptomSeverity(AddSymptomSeverityModel request);
  Future<void> addSymptomActivity(AddSymptomActivityModel request);
  Future<List<ActivityModel>> fetchActivities();
  Future<void> removeSymptomActivity(String logEventId, String activityId);
}

class SymptomTrackerRepositoryImpl extends SymptomTrackerRepository {
  final SymptomTrackerService _service = SymptomTrackerLocator().get();
  @override
  Future<List<TrackedSymptomModel>> fetchTrackedSymptoms() {
    return _service.fetchTrackedSymptoms();
  }

  @override
  Future<void> addSymptomActivity(AddSymptomActivityModel request) {
    return _service.addSymptomActivity(request);
  }

  @override
  Future<void> addSymptomSeverity(AddSymptomSeverityModel request) {
    return _service.addSymptomSeverity(request);
  }

  @override
  Future<List<ActivityModel>> fetchActivities() {
    return _service.fetchActivities();
  }

  @override
  Future<void> removeSymptomActivity(String logEventId, String activityId) {
    return _service.removeSymptomActivity(logEventId, activityId);
  }
}
