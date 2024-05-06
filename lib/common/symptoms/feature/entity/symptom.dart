import 'package:oria_pro/common/symptoms/feature/entity/symptom_info.dart';

class Symptom {
  final String userSymptomId;
  final String symptomId;
  final String icon;
  final String name;
  final SymptomType type;

  const Symptom({
    required this.userSymptomId,
    required this.symptomId,
    required this.icon,
    required this.name,
    required this.type,
  });
}

enum SymptomType { primary, secondary }

extension SymptomMappers on Symptom {
  SymptomInfo toSymptom() {
    return SymptomInfo(
      symptomId: symptomId,
      icon: icon,
      name: name,
    );
  }
}
