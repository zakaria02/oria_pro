import 'package:hive/hive.dart';
import 'package:oria_pro/client/moduls/tracker/feature/enitity/activity.dart';

part 'selectable_activity_model.g.dart';

@HiveType(typeId: 2)
class SelectableActivityModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String icon;

  SelectableActivityModel({
    required this.id,
    required this.name,
    required this.icon,
  });
}

extension SelectableActivityModelMappers on SelectableActivityModel {
  Activity toActivity() {
    return Activity(
      icon: icon,
      name: name,
      id: id,
    );
  }
}
