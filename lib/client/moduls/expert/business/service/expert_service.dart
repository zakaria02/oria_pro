import 'package:dio/dio.dart';
import 'package:oria_pro/client/moduls/expert/business/model/expert_response_model.dart';
import 'package:retrofit/retrofit.dart';

import '../model/availability_response_model.dart';
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

  @GET("/consultation/experts")
  Future<ExpertResponseModel> fetchSpecialtyExperts(
      @Query("specialty") String? specialtyId, @Query("page") int page,
      {@Query("limit") int limit = 10});

  @GET("/consultation/experts/{expertId}/availability/{day}")
  Future<AvailabilityResponseModel> getDayAvailabilities(
      @Path() String expertId, @Path() String day);
}
