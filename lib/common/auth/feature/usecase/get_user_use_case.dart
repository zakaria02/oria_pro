import '../../../symptoms/business/locator/symptom_locator.dart';
import '../../../symptoms/business/model/user_symptom_model.dart';
import '../../../symptoms/business/repository/symptom_repository.dart';
import '../../business/email_password/locator/email_password_locator.dart';
import '../../business/email_password/model/user_model.dart';
import '../../business/email_password/model/user_response_model.dart';
import '../../business/email_password/repository/email_password_repository.dart';
import '../../business/local_data_source/auth_local_data_source.dart';
import '../entity/auth_step.dart';

class GetUserUseCase {
  AuthLocalDataSource authLocalDataSource = EmailPasswordAuthLocator().get();
  EmailPasswordRepository repository = EmailPasswordAuthLocator().get();
  SymptomRepository symptomRepository = SymptomLocator().get();

  Future<AuthStep?> execute() async {
    UserModel? user = await authLocalDataSource.getUser();

    if (user == null) {
      return null;
    }

    if (user.accessTokenExpire.difference(DateTime.now()).isNegative) {
      return null;
    }

    UserResponseModel userModel = await repository.getUser(user.id);

    UserModel updatedUser = user.copyWith(
        hasFinishedOnboarding: userModel.hasFinishedOnboarding,
        name: userModel.name,
        birthDay: userModel.birthDay);
    await authLocalDataSource.saveUser(updatedUser);

    List<UserSymptomModel> symptoms =
        await symptomRepository.fetchUserSymptoms();

    if (!updatedUser.hasFinishedOnboarding) {
      return AuthStep.onBoarding;
    }
    if (symptoms.isEmpty) {
      return AuthStep.symptom;
    }

    if (updatedUser.name == null) {
      return AuthStep.name;
    }

    if (updatedUser.birthDay == null) {
      return AuthStep.birthday;
    }
    return AuthStep.finished;
  }
}
