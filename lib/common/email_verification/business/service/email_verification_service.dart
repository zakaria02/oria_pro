import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'email_verification_service.g.dart';

@RestApi()
abstract class EmailVerificationService {
  factory EmailVerificationService(Dio dio, {String baseUrl}) =
      _EmailVerificationService;

  @POST("/auth/send-verification-email")
  Future<void> sendVerificationEmail();

  @POST("/auth/verify-email?token={token}")
  Future<void> verifyEmail(@Path() String token);
}
