import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../model/facebook_request_model.dart';
import '../model/google_request_model.dart';
import '../model/other_methodes_user_model.dart';

part 'other_methods_service.g.dart';

@RestApi()
abstract class OtherMethodsService {
  factory OtherMethodsService(Dio dio, {String baseUrl}) = _OtherMethodsService;

  @POST("/auth/google")
  Future<OtherMethodesUserModel> googleSignIn(
      @Body() GoogleRequestModel request);

  @POST("/auth/facebook")
  Future<OtherMethodesUserModel> facebookSignIn(
      @Body() FacebookRequestModel request);
}
