import 'package:dio/dio.dart';
import 'package:oria_pro/client/moduls/account/business/model/medical_info_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'medical_info_service.g.dart';

@RestApi()
abstract class MedicalInfoService {
  factory MedicalInfoService(Dio dio, {String baseUrl}) = _MedicalInfoService;
  @GET("/users/medical-info")
  Future<MedicalInfoModel> getMedicalInfo();

  @POST("/users/medical-info")
  Future<MedicalInfoModel> addMedicalInfo(@Body() MedicalInfoModel request);

  @PUT("/users/medical-info")
  Future<MedicalInfoModel> updateMedicalInfo(@Body() MedicalInfoModel request);
}
