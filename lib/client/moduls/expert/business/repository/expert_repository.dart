import 'package:oria_pro/client/moduls/expert/business/locator/expert_locator.dart';
import 'package:oria_pro/client/moduls/expert/business/model/availability_response_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/expert_response_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/specialty_response_model.dart';
import 'package:oria_pro/client/moduls/expert/business/service/expert_service.dart';

abstract class ExpertRepository {
  Future<List<SpecialtyReposneModel>> fetchSpecialties();
  Future<List<ExpertModel>> fetchRecommendedExperts();
  Future<List<ExpertModel>> fetchBestRatedExperts();
  Future<List<ExpertModel>> fetchSpecialtyExperts(
      String? specialtyId, int page);
  Future<AvailabilityResponseModel> getDayAvailabilities(
      String expertId, String day);
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
      String? specialtyId, int page) async {
    return (await _service.fetchSpecialtyExperts(specialtyId, page)).experts;
  }

  @override
  Future<AvailabilityResponseModel> getDayAvailabilities(
      String expertId, String day) {
    return _service.getDayAvailabilities(expertId, day);
  }
}
