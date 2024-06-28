import 'package:oria_pro/client/moduls/account/business/locator/account_locator.dart';

import '../../../../client/moduls/account/feature/use_case/set_player_id_use_case.dart';
import '../../business/email_password/locator/email_password_locator.dart';
import '../../business/email_password/model/auth_request_model.dart';
import '../../business/email_password/model/user_model.dart';
import '../../business/email_password/repository/email_password_repository.dart';
import '../../business/local_data_source/auth_local_data_source.dart';

class LoginUseCase {
  EmailPasswordRepository emailPasswordRepository =
      EmailPasswordAuthLocator().get();
  AuthLocalDataSource authLocalDataSource = EmailPasswordAuthLocator().get();
  SetPlayerIdUseCase setPlayerIdUseCase = AccountLocator().get();

  Future<UserModel> execute(String email, String password) async {
    UserModel user = await emailPasswordRepository.signInWithEmailAndPassword(
        AuthRequestModel(email: email, password: password));
    await authLocalDataSource.saveUser(user);
    await setPlayerIdUseCase.execute();
    return user;
  }
}
