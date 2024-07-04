import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oria_pro/common/auth/business/email_password/model/auth_response_model.dart';
import '../../../../../utils/network/dio_builder.dart';
import '../locator/email_password_locator.dart';
import '../model/auth_request_model.dart';
import '../model/forgot_password_request.dart';
import '../model/reset_password_request.dart';
import '../model/update_profile_request_model.dart';
import '../model/update_profile_response_model.dart';
import '../model/user_model.dart';
import '../model/user_response_model.dart';
import '../service/email_password_service.dart';
import 'package:path/path.dart';

abstract class EmailPasswordRepository {
  Future<UserModel> signInWithEmailAndPassword(AuthRequestModel request);
  Future<UserModel> signUpWithEmailAndPassword(AuthRequestModel request);
  Future<UserResponseModel> getUser(String userId);
  Future<UpdateProfileResponseModel> updateProfileInfo(
      UpdateProfileRequestModel request);
  Future<void> updateUserPicture(File image);
  Future<void> forgotPassword(ForgotPasswordRequest request);

  Future<void> resetPassword(ResetPasswordRequest request, String token);
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

  @override
  Future<void> updateUserPicture(File image) async {
    final dio = DioBuilder().dio;
    FormData formData = FormData.fromMap(
      {
        "file": await MultipartFile.fromFile(
          image.path,
          filename: basename(image.path),
        ),
      },
    );
    await dio.post("/users/upload-profile-image", data: formData);
  }

  @override
  Future<void> forgotPassword(ForgotPasswordRequest request) {
    return service.forgotPassword(request);
  }

  @override
  Future<void> resetPassword(ResetPasswordRequest request, String token) {
    return service.resetPassword(request, token);
  }
}
