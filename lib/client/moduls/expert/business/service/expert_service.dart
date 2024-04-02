import 'package:dio/dio.dart';
import 'package:oria_pro/client/moduls/expert/business/model/expert_response_model.dart';
import 'package:retrofit/retrofit.dart';

import '../model/appointment_model.dart';
import '../model/availability_response_model.dart';
import '../model/cancel_appointment_request_model.dart';
import '../model/create_appointment_request_model.dart';
import '../model/create_appointment_response_model.dart';
import '../model/pay_invoice_request_model.dart';
import '../model/pay_invoice_response_model.dart';
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

  @POST("/consultation/appointement/create")
  Future<CreateAppointmentResponseModel> createAppointment(
      @Body() CreateAppointmentRequestModel request);

  @GET("/consultation/experts/{expertId}")
  Future<ExpertModel> getExpert(@Path() final String expertId);

  @POST("/consultation/appointement/pay-invoice")
  Future<PayInvoiceResponseModel> payInvoice(
      @Body() PayInvoiceRequestModel request);

  @GET("/consultation/appointements/all")
  Future<List<AppointmentModel>> fetchAllAppointments();

  @GET("/consultation/appointements/upcoming")
  Future<List<AppointmentModel>> fetchUpcomingAppointments();

  @POST("/consultation/appointement/cancel")
  Future<void> cancelAppointment(@Body() CancelAppointmentRequestModel request);
}
