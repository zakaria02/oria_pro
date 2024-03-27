import '../locator/symptom_locator.dart';
import '../model/symptom_info_model.dart';
import '../model/symptom_severity_request_model.dart';
import '../model/user_symptom_model.dart';
import '../model/user_symptom_request_model.dart';
import '../model/user_symptom_response_model.dart';
import '../service/symptom_service.dart';

abstract class SymptomRepository {
  Future<List<UserSymptomModel>> fetchUserSymptoms();
  Future<List<SymptomInfoModel>> fetchAllSymptoms();
  Future<List<UserSymptomResponseModel>> addUserSymptom(
      UserSymptomRequestModel request);
  Future<void> addSymptomSeverity(SymptomSeverityRequestModel request);
}

class SymptomRepositoryImpl implements SymptomRepository {
  SymptomService service = SymptomLocator().get();
  @override
  Future<List<UserSymptomModel>> fetchUserSymptoms() {
    return service.fetchUserSymptoms();
  }

  @override
  Future<List<SymptomInfoModel>> fetchAllSymptoms() {
    return service.fetchAllSymptoms();
  }

  @override
  Future<List<UserSymptomResponseModel>> addUserSymptom(
      UserSymptomRequestModel request) {
    return service.addUserSymptom(request);
  }

  @override
  Future<void> addSymptomSeverity(SymptomSeverityRequestModel request) {
    return service.addSymptomSeverity(request);
  }
}
