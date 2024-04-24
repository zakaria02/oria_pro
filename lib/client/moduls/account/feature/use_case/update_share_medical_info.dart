import 'package:oria_pro/common/auth/business/email_password/locator/email_password_locator.dart';
import 'package:oria_pro/common/auth/business/email_password/model/update_profile_request_model.dart';
import 'package:oria_pro/common/auth/business/email_password/repository/email_password_repository.dart';
import 'package:oria_pro/common/auth/business/local_data_source/auth_local_data_source.dart';

class UpdateShareMedicalInfoUseCase {
  final EmailPasswordRepository _repository = EmailPasswordAuthLocator().get();
  final AuthLocalDataSource _localDataSource = EmailPasswordAuthLocator().get();
  Future<bool> execute(bool shareMedicalInfo) async {
    final user = await _repository.updateProfileInfo(
        UpdateProfileRequestModel(shareMedicalInfo: shareMedicalInfo));

    final currenUserModel = await _localDataSource.getUser();

    if (currenUserModel == null) {
      return false;
    }

    final updatedUser = currenUserModel.copyWith(
        email: user.email, name: user.name, birthDay: user.birthDay);

    await _localDataSource.saveUser(updatedUser);

    return true;
  }
}
