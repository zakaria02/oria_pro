import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/verify_email_request_model.dart';

part 'email_verification_service.g.dart';

@RestApi()
abstract class EmailVerificationService {
  factory EmailVerificationService(Dio dio, {String baseUrl}) =
      _EmailVerificationService;

  @GET("/auth/send-verification-email")
  Future<void> sendVerificationEmail();

  @POST("/auth/verify-email")
  Future<void> verifyEmail(@Body() VerifyEmailRequestModel request);
}
