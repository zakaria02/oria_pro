import 'package:oria_pro/common/symptoms/business/locator/symptom_locator.dart';
import 'package:oria_pro/common/symptoms/business/model/user_symptom_model.dart';
import 'package:oria_pro/common/symptoms/business/repository/symptom_repository.dart';

import '../entity/symptom.dart';

class GetUserSymptomsUsecase {
  final SymptomRepository _repository = SymptomLocator().get();
  Future<List<Symptom>> execute() async {
    final symptoms = await _repository.fetchUserSymptoms();
    final currentSymptoms =
        symptoms.map((symptom) => symptom.toSymptom()).toList();
    currentSymptoms.sort((a, b) {
      if (a.type == SymptomType.primary && b.type == SymptomType.secondary) {
        return -1;
      } else if (a.type == SymptomType.secondary &&
          b.type == SymptomType.primary) {
        return 1;
      } else {
        return 0;
      }
    });
    return currentSymptoms;
  }
}
