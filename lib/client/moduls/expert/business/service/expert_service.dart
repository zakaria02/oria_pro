import 'package:dio/dio.dart';
import 'package:oria_pro/client/moduls/expert/business/model/expert_response_model.dart';
import 'package:retrofit/retrofit.dart';

import '../model/specialty_response_model.dart';

part 'expert_service.g.dart';

@RestApi()
abstract class ExpertService {
  factory ExpertService(Dio dio, {String baseUrl}) = _ExpertService;
  @GET("/metadata/specialities")
  Future<List<SpecialtyReposneModel>> fetchSpecialties();

  @GET("/consultation/experts/recommended")
  Future<ExpertResponseModel> fetchRecommendedExperts();

  @GET("/consultation/experts/best-rated")
  Future<ExpertResponseModel> fetchBestRatedExperts();

  @GET(
      "/consultation/experts?specialty={specialtyId}&page={page}&limit={limit}")
  Future<ExpertResponseModel> fetchSpecialtyExperts(
      @Path() String? specialtyId, @Path() int page,
      {@Path() int limit = 10});
}
