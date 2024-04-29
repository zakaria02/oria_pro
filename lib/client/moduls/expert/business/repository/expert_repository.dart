import 'dart:io';

import 'package:oria_pro/client/moduls/expert/business/locator/expert_locator.dart';
import 'package:oria_pro/client/moduls/expert/business/model/add_review_request_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/appointment_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/availability_response_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/cancel_appointment_request_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/create_appointment_request_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/create_appointment_response_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/expert_response_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/pay_invoice_request_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/pay_invoice_response_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/review_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/specialty_response_model.dart';
import 'package:oria_pro/client/moduls/expert/business/service/expert_service.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../utils/network/dio_builder.dart';
import '../model/city_model.dart';
import '../model/meeting_access_reponse_model.dart';

abstract class ExpertRepository {
  Future<List<SpecialtyReposneModel>> fetchSpecialties();
  Future<List<ExpertModel>> fetchRecommendedExperts();
  Future<List<ExpertModel>> fetchBestRatedExperts();
  Future<List<ExpertModel>> fetchSpecialtyExperts(
      String? specialtyId, String? cityId, int? rating, int page);
  Future<AvailabilityResponseModel> getDayAvailabilities(
      String expertId, String day);
  Future<CreateAppointmentResponseModel> createAppointment(
      CreateAppointmentRequestModel request);
  Future<ExpertModel> getExpert(String expertId);
  Future<PayInvoiceResponseModel> payInvoice(PayInvoiceRequestModel request);
  Future<List<AppointmentModel>> fetchAppointments();
  Future<List<AppointmentModel>> fetchUpcomingAppointments();
  Future<void> cancelAppointment(String id);
  Future<MeetingAccessResponseModel> getMeetingAccessKey(String appointmentId);
  Future<List<CityModel>> getCities();
  Future<List<ReviewModel>> getExpertReviews(String expertId);
  Future<void> addReview(AddReviewRequestModel request);
  Future<File> downloadPrescription(String appointmentId);
}

class ExpertRepositoryImpl extends ExpertRepository {
  final ExpertService _service = ExpertLocator().get();
  @override
  Future<List<SpecialtyReposneModel>> fetchSpecialties() {
    return _service.fetchSpecialties();
  }

  @override
  Future<List<ExpertModel>> fetchBestRatedExperts() async {
    return (await _service.fetchBestRatedExperts()).experts;
  }

  @override
  Future<List<ExpertModel>> fetchRecommendedExperts() async {
    return (await _service.fetchRecommendedExperts()).experts;
  }

  @override
  Future<List<ExpertModel>> fetchSpecialtyExperts(
      String? specialtyId, String? cityId, int? rating, int page) async {
    return (await _service.fetchSpecialtyExperts(
            specialtyId, cityId, rating, page))
        .experts;
  }

  @override
  Future<AvailabilityResponseModel> getDayAvailabilities(
      String expertId, String day) {
    return _service.getDayAvailabilities(expertId, day);
  }

  @override
  Future<CreateAppointmentResponseModel> createAppointment(
      CreateAppointmentRequestModel request) {
    return _service.createAppointment(request);
  }

  @override
  Future<ExpertModel> getExpert(String expertId) {
    return _service.getExpert(expertId);
  }

  @override
  Future<PayInvoiceResponseModel> payInvoice(PayInvoiceRequestModel request) {
    return _service.payInvoice(request);
  }

  @override
  Future<List<AppointmentModel>> fetchAppointments() {
    return _service.fetchAllAppointments();
  }

  @override
  Future<void> cancelAppointment(String id) {
    return _service
        .cancelAppointment(CancelAppointmentRequestModel(appointmentId: id));
  }

  @override
  Future<List<AppointmentModel>> fetchUpcomingAppointments() {
    return _service.fetchUpcomingAppointments();
  }

  @override
  Future<MeetingAccessResponseModel> getMeetingAccessKey(String appointmentId) {
    return _service.getMeetingAccessKey(appointmentId);
  }

  @override
  Future<List<CityModel>> getCities() {
    return _service.fetchCities();
  }

  @override
  Future<List<ReviewModel>> getExpertReviews(String expertId) {
    return _service.getExpertReviews(expertId);
  }

  @override
  Future<void> addReview(AddReviewRequestModel request) {
    return _service.addReview(request);
  }

  @override
  Future<File> downloadPrescription(String appointmentId) async {
    final dio = DioBuilder().dio;
    Directory? dir;

    if (Platform.isIOS) {
      dir = await getApplicationDocumentsDirectory();
    } else {
      dir = Directory('/storage/emulated/0/Download/');
      if (!await dir.exists()) dir = (await getExternalStorageDirectory())!;
    }

    await dio.download("/consultation/appointement/$appointmentId/prescription",
        "${dir.path}/$appointmentId.pdf");
    return File("${dir.path}/$appointmentId.pdf");
  }
}
