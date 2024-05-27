import '../../../../client/moduls/explore/business/model/explore_symptom_program_model.dart';
import '../locator/symptom_locator.dart';
import '../model/set_todays_actions_request.dart';
import '../model/symptom_content_model.dart';
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
  Future<SymptomContentModel> getSymptomContent(String symptomId);
  Future<void> setTodaysActionsProgram(String programId);
  Future<List<ProgramSymptomModel>> getTodayActionsProgram();
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

  @override
  Future<SymptomContentModel> getSymptomContent(String symptomId) {
    return service.getSymptomContent(symptomId);
  }

  @override
  Future<void> setTodaysActionsProgram(String programId) {
    return service.setTodaysActionsProgram(
      SetTodaysActionsProgram(programId: programId),
    );
  }

  @override
  Future<List<ProgramSymptomModel>> getTodayActionsProgram() async {
    return (await service.getTodayActionsProgram()).programs;
  }
}
