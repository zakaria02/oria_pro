import 'package:oria_pro/client/moduls/tracker/business/model/selectable_activity_model.dart';

import '../../business/locator/tracker_locator.dart';
import '../../business/service/symptom_tracker_local_ds.dart';
import '../enitity/activity.dart';

class GetActivityUseCase {
  final SymptomTrackerDataSource _repository = SymptomTrackerLocator().get();
  Future<List<Activity>> execute() async {
    final activitiesModel = await _repository.getActivities();
    final activities =
        activitiesModel?.map((activity) => activity.toActivity()).toList() ??
            [];
    return activities;
  }
}
