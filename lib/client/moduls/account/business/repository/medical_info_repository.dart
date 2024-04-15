import 'package:oria_pro/client/moduls/account/business/locator/account_locator.dart';
import 'package:oria_pro/client/moduls/account/business/service/medical_info_service.dart';

import '../model/medical_info_model.dart';

abstract class MedicalInfoRepository {
  Future<MedicalInfoModel> getMedicalInfo();
  Future<MedicalInfoModel> addMedicalInfo(MedicalInfoModel request);
  Future<MedicalInfoModel> updateMedicalInfo(MedicalInfoModel request);
}

class MedicalInfoRepositoryImpl extends MedicalInfoRepository {
  final MedicalInfoService _service = AccountLocator().get();
  @override
  Future<MedicalInfoModel> addMedicalInfo(MedicalInfoModel request) {
    return _service.addMedicalInfo(request);
  }

  @override
  Future<MedicalInfoModel> getMedicalInfo() {
    return _service.getMedicalInfo();
  }

  @override
  Future<MedicalInfoModel> updateMedicalInfo(MedicalInfoModel request) {
    return _service.updateMedicalInfo(request);
  }
}
