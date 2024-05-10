import '../../../../../common/symptoms/feature/entity/symptom_info.dart';
import 'activity.dart';

class TrackedSymptom {
  final String icon;
  final String name;
  final String id;
  final String symptomId;
  final bool isPrimary;
  final int? logEventValue;
  final String? logEventId;
  final List<Activity> loggedActivities;

  const TrackedSymptom({
    required this.icon,
    required this.name,
    required this.id,
    required this.symptomId,
    required this.isPrimary,
    required this.logEventValue,
    required this.logEventId,
    required this.loggedActivities,
  });
}

extension TrackedSymptomMappers on TrackedSymptom {
  SymptomInfo toSymptom() {
    return SymptomInfo(
      symptomId: symptomId,
      icon: icon,
      name: name,
    );
  }
}
