import 'package:oria_pro/common/auth/business/email_password/model/auth_response_model.dart';
import '../locator/email_password_locator.dart';
import '../model/auth_request_model.dart';
import '../model/update_profile_request_model.dart';
import '../model/update_profile_response_model.dart';
import '../model/user_model.dart';
import '../model/user_response_model.dart';
import '../service/email_password_service.dart';

abstract class EmailPasswordRepository {
  Future<UserModel> signInWithEmailAndPassword(AuthRequestModel request);
  Future<UserModel> signUpWithEmailAndPassword(AuthRequestModel request);
  Future<UserResponseModel> getUser(String userId);
  Future<UpdateProfileResponseModel> updateProfileInfo(
      UpdateProfileRequestModel request);
}

class EmailPasswordRepositoryImpl implements EmailPasswordRepository {
  EmailPasswordService service = EmailPasswordAuthLocator().get();
  @override
  Future<UserModel> signInWithEmailAndPassword(AuthRequestModel request) async {
    return (await service.signInWithEmailAndPassword(request)).toUserModel();
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword(AuthRequestModel request) async {
    return (await service.signUpWithEmailAndPassword(request)).toUserModel();
  }

  @override
  Future<UserResponseModel> getUser(String userId) async {
    return service.getUser(userId);
  }

  @override
  Future<UpdateProfileResponseModel> updateProfileInfo(
      UpdateProfileRequestModel request) {
    return service.updateProfileInfo(request);
  }
}
