import 'package:oria_pro/client/moduls/tracker/business/locator/tracker_locator.dart';
import 'package:oria_pro/client/moduls/tracker/business/service/symptom_tracker_service.dart';

import '../model/tracked_symptom_model.dart';

abstract class SymptomTrackerRepository {
  Future<List<TrackedSymptomModel>> fetchTrackedSymptoms();
}

class SymptomTrackerRepositoryImpl extends SymptomTrackerRepository {
  final SymptomTrackerService _service = SymptomTrackerLocator().get();
  @override
  Future<List<TrackedSymptomModel>> fetchTrackedSymptoms() {
    return _service.fetchTrackedSymptoms();
  }
}
