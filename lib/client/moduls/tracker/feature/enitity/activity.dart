import '../../business/model/selectable_activity_model.dart';

class Activity {
  final String icon;
  final String name;
  final String id;

  const Activity({
    required this.icon,
    required this.name,
    required this.id,
  });
}

extension ActivityMappers on Activity {
  SelectableActivityModel toSelectableActivity() {
    return SelectableActivityModel(icon: icon, name: name, id: id);
  }
}
