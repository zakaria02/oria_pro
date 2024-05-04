import 'package:oria_pro/client/moduls/tracker/business/model/activity_model.dart';
import 'package:oria_pro/client/moduls/tracker/business/model/selectable_activity_model.dart';
import 'package:oria_pro/client/moduls/tracker/business/service/symptom_tracker_local_ds.dart';

import '../../business/locator/tracker_locator.dart';
import '../../business/repository/symptom_tracker_repository.dart';
import '../enitity/activity.dart';

class FetchActivityUseCase {
  final SymptomTrackerRepository _repository = SymptomTrackerLocator().get();
  final SymptomTrackerDataSource _ds = SymptomTrackerLocator().get();
  Future<List<Activity>> execute() async {
    final savedActivities = await _ds.getActivities();
    if (savedActivities != null && savedActivities.length >= 12) {
      return savedActivities
          .map((savedActivity) => savedActivity.toActivity())
          .toList();
    }
    final activitiesModel = await _repository.fetchActivities();
    final activities =
        activitiesModel.map((activity) => activity.toActivity()).toList();
    final alreadyExistActivities =
        savedActivities?.map((act) => act.toActivity()) ?? [];
    final int savedLength = alreadyExistActivities.length;
    final notSavedActivities = activities
        .where((act) =>
            alreadyExistActivities.where((a) => a.id == act.id).isEmpty)
        .toList();
    return [
      ...alreadyExistActivities,
      ...notSavedActivities.take(12 - savedLength)
    ];
  }
}
