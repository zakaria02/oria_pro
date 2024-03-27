import '../../business/locator/symptom_locator.dart';
import '../../business/model/user_symptom_request_model.dart';
import '../../business/repository/symptom_repository.dart';

class AddSecondarySymptomUsecase {
  SymptomRepository repository = SymptomLocator().get();
  Future<void> execute(String id) async {
    await repository.addUserSymptom(UserSymptomRequestModel(
      symptomId: id,
      type: "secondary",
    ));
  }
}
