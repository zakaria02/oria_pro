import 'package:dio/dio.dart';
import 'package:oria_pro/common/auth/business/email_password/model/reset_password_request.dart';
import 'package:retrofit/retrofit.dart';

import '../model/auth_request_model.dart';
import '../model/auth_response_model.dart';
import '../model/forgot_password_request.dart';
import '../model/update_profile_request_model.dart';
import '../model/update_profile_response_model.dart';
import '../model/user_response_model.dart';

part 'email_password_service.g.dart';

@RestApi()
abstract class EmailPasswordService {
  factory EmailPasswordService(Dio dio, {String baseUrl}) =
      _EmailPasswordService;

  @POST("/auth/login")
  Future<AuthResponseModel> signInWithEmailAndPassword(
      @Body() AuthRequestModel request);

  @POST("/auth/register")
  Future<AuthResponseModel> signUpWithEmailAndPassword(
      @Body() AuthRequestModel request);

  @GET("/users/{id}")
  Future<UserResponseModel> getUser(@Path() String id);

  @POST("/auth/forgot-password")
  Future<void> forgotPassword(@Body() ForgotPasswordRequest request);

  @POST("/auth/reset-password")
  Future<void> resetPassword(
      @Body() ResetPasswordRequest request, @Query("token") String token);

  @POST("/users/profile/update")
  Future<UpdateProfileResponseModel> updateProfileInfo(
      @Body() UpdateProfileRequestModel request);
}
