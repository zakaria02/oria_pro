import '../../../symptoms/business/locator/symptom_locator.dart';
import '../../../symptoms/business/model/user_symptom_model.dart';
import '../../../symptoms/business/repository/symptom_repository.dart';
import '../../../symptoms/feature/entity/symptom.dart';
import '../../business/email_password/locator/email_password_locator.dart';
import '../../business/email_password/model/user_model.dart';
import '../../business/email_password/model/user_response_model.dart';
import '../../business/email_password/repository/email_password_repository.dart';
import '../../business/local_data_source/auth_local_data_source.dart';
import '../entity/onbaording_step.dart';

class GetUserStepsUseCase {
  AuthLocalDataSource authLocalDataSource = EmailPasswordAuthLocator().get();
  EmailPasswordRepository repository = EmailPasswordAuthLocator().get();
  SymptomRepository symptomRepository = SymptomLocator().get();

  Future<OnBoardingSteps?> execute() async {
    UserModel? user = await authLocalDataSource.getUser();

    if (user == null ||
        user.accessTokenExpire.difference(DateTime.now()).isNegative) {
      return null;
    }

    UserResponseModel userModel = await repository.getUser(user.id);
    final updatedUser = user.copyWith(
      name: userModel.name,
      birthDay: userModel.birthDay,
      profilePicture: userModel.profilePicture,
    );
    await authLocalDataSource.saveUser(updatedUser);

    List<UserSymptomModel> userSymptoms =
        await symptomRepository.fetchUserSymptoms();
    List<Symptom> symptoms =
        userSymptoms.map((symp) => symp.toSymptom()).toList();

    // Correctly filtering primary and secondary symptoms
    List<Symptom> primarySymptoms = symptoms
        .where((symptom) => symptom.type == SymptomType.primary)
        .toList();
    List<Symptom> secondarySymptoms = symptoms
        .where((symptom) => symptom.type == SymptomType.secondary)
        .toList();

    int stepsCount =
        _calculateStepsCount(updatedUser, primarySymptoms, secondarySymptoms);

    return OnBoardingSteps(
      name: updatedUser.name,
      birthDay: updatedUser.birthDay,
      primarySymptoms: primarySymptoms,
      secondarySymptoms: secondarySymptoms,
      stepsCount: stepsCount,
      emailToVerify: updatedUser.isEmailVerified ? null : updatedUser.email,
    );
  }

  int _calculateStepsCount(
    UserModel updatedUser,
    List<Symptom> primarySymptoms,
    List<Symptom> secondarySymptoms,
  ) {
    int stepsCount = 0;
    if (updatedUser.name == null) stepsCount++;
    if (updatedUser.birthDay == null) stepsCount++;
    if (primarySymptoms.isEmpty) stepsCount += 3;
    if (secondarySymptoms.isEmpty) stepsCount++;
    return stepsCount;
  }
}
