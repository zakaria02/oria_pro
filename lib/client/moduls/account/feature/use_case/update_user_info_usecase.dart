import 'dart:io';

import 'package:oria_pro/common/auth/business/email_password/locator/email_password_locator.dart';
import 'package:oria_pro/common/auth/business/email_password/model/auth_response_model.dart';
import 'package:oria_pro/common/auth/business/email_password/model/update_profile_request_model.dart';
import 'package:oria_pro/common/auth/business/email_password/repository/email_password_repository.dart';
import 'package:oria_pro/common/auth/business/local_data_source/auth_local_data_source.dart';

import '../../../../../common/entity/user.dart';

class UpdateMyInfoUseCase {
  final EmailPasswordRepository _repository = EmailPasswordAuthLocator().get();
  final AuthLocalDataSource _localDataSource = EmailPasswordAuthLocator().get();
  Future<bool> execute(User currentUser, String email, String name,
      DateTime? birthday, File? image) async {
    final updatedEmail =
        email.isNotEmpty && email != currentUser.email ? email : null;
    final updatedName =
        name.isNotEmpty && name != currentUser.name ? name : null;
    final updatedBirthday = birthday != null &&
            (birthday.day != currentUser.birthDay?.day ||
                birthday.month != currentUser.birthDay?.month ||
                birthday.year != currentUser.birthDay?.year)
        ? birthday
        : null;

    if (image != null) {
      _repository.updateUserPicture(image);
    }

    final user = await _repository.updateProfileInfo(UpdateProfileRequestModel(
      name: updatedName,
      email: updatedEmail,
      birthDay: updatedBirthday,
    ));

    final gettedUser = await _repository.getUser(user.id);

    final currenUserModel = await _localDataSource.getUser();

    if (currenUserModel == null) {
      return false;
    }

    final updatedUser = gettedUser.toUserModel(currenUserModel).copyWith(
          email: user.email,
          name: user.name,
          birthDay: user.birthDay,
          profilePicture: gettedUser.profilePicture,
        );

    await _localDataSource.saveUser(updatedUser);

    return true;
  }
}
