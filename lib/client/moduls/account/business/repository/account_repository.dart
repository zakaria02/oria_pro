import 'package:oria_pro/client/moduls/account/business/locator/account_locator.dart';
import 'package:oria_pro/client/moduls/account/business/model/delete_account_model.dart';
import 'package:oria_pro/client/moduls/account/business/service/account_service.dart';

import '../model/medical_info_model.dart';

abstract class AccountRepository {
  Future<MedicalInfoModel> getMedicalInfo();
  Future<MedicalInfoModel> addMedicalInfo(MedicalInfoModel request);
  Future<MedicalInfoModel> updateMedicalInfo(MedicalInfoModel request);
  Future<void> deleteAccount();
  Future<void> deleteAccount2fa(String token);
}

class AccountRepositoryImpl extends AccountRepository {
  final AccountService _service = AccountLocator().get();
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

  @override
  Future<void> deleteAccount() {
    return _service.deleteAccount();
  }

  @override
  Future<void> deleteAccount2fa(String token) {
    return _service.deleteAccount2fa(DeleteAccountModel(token: token));
  }
}
