import 'package:hive/hive.dart';
import 'package:oria_pro/client/moduls/tracker/business/model/selectable_activity_model.dart';

import '../../../../../utils/constants/oria_links.dart';

class SymptomTrackerDataSource {
  Future<void> saveActivity(SelectableActivityModel activity) async {
    Box<SelectableActivityModel> box =
        await Hive.openBox<SelectableActivityModel>(OriaLinks.activityHiveBox);
    if (box.isOpen) {
      await box.put(activity.id, activity).whenComplete(() async {
        await box.close();
      });
    }
  }

  Future<List<SelectableActivityModel>?> getActivities() async {
    Box<SelectableActivityModel> box =
        await Hive.openBox<SelectableActivityModel>(OriaLinks.activityHiveBox);
    if (box.isOpen) {
      final activities = box.values.toList();
      await box.close();
      return activities;
    }
    return null;
  }

  Future<void> deleteactivity(SelectableActivityModel activity) async {
    Box<SelectableActivityModel> box =
        await Hive.openBox<SelectableActivityModel>(OriaLinks.activityHiveBox);
    if (box.isOpen) {
      await box.delete(activity.id).whenComplete(() async {
        await box.close();
      });
    }
  }
}
