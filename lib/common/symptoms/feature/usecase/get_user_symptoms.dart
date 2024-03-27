import 'package:oria_pro/common/symptoms/business/locator/symptom_locator.dart';
import 'package:oria_pro/common/symptoms/business/model/user_symptom_model.dart';
import 'package:oria_pro/common/symptoms/business/repository/symptom_repository.dart';

import '../entity/symptom.dart';

class GetUserSymptomsUsecase {
  final SymptomRepository _repository = SymptomLocator().get();
  Future<List<Symptom>> execute() async {
    final symptoms = await _repository.fetchUserSymptoms();
    return symptoms.map((symptom) => symptom.toSymptom()).toList();
  }
}
