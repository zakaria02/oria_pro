import '../../../symptoms/business/locator/symptom_locator.dart';
import '../../../symptoms/business/repository/symptom_repository.dart';
import '../../business/email_password/locator/email_password_locator.dart';
import '../../business/email_password/model/auth_request_model.dart';
import '../../business/email_password/model/user_model.dart';
import '../../business/email_password/repository/email_password_repository.dart';
import '../../business/local_data_source/auth_local_data_source.dart';

class LoginUseCase {
  EmailPasswordRepository emailPasswordRepository =
      EmailPasswordAuthLocator().get();
  AuthLocalDataSource authLocalDataSource = EmailPasswordAuthLocator().get();
  SymptomRepository symptomRepository = SymptomLocator().get();

  Future<UserModel> execute(String email, String password) async {
    UserModel user = await emailPasswordRepository.signInWithEmailAndPassword(
        AuthRequestModel(email: email, password: password));
    await authLocalDataSource.saveUser(user);
    return user;
  }
}
