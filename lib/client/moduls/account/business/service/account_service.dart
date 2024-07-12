import 'package:dio/dio.dart';
import 'package:oria_pro/client/moduls/account/business/model/delete_account_model.dart';
import 'package:oria_pro/client/moduls/account/business/model/medical_info_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'account_service.g.dart';

@RestApi()
abstract class AccountService {
  factory AccountService(Dio dio, {String baseUrl}) = _AccountService;
  @GET("/users/medical-info")
  Future<MedicalInfoModel> getMedicalInfo();

  @POST("/users/medical-info")
  Future<MedicalInfoModel> addMedicalInfo(@Body() MedicalInfoModel request);

  @PUT("/users/medical-info")
  Future<MedicalInfoModel> updateMedicalInfo(@Body() MedicalInfoModel request);

  @POST("/users/account/delete-token")
  Future<void> deleteAccount();

  @POST("/users/delete-account")
  Future<void> deleteAccount2fa(@Body() DeleteAccountModel request);
}
