import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/expert/business/locator/expert_locator.dart';
import 'package:oria_pro/client/moduls/expert/business/model/expert_response_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/review_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/specialty_response_model.dart';
import 'package:oria_pro/client/moduls/expert/business/repository/expert_repository.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/specialty.dart';

import '../../../account/business/locator/account_locator.dart';
import '../../../account/business/repository/medical_info_repository.dart';
import '../entity/city.dart';
import '../entity/expert.dart';
import '../entity/review.dart';

part 'expert_event.dart';
part 'expert_state.dart';

class ExpertBloc extends Bloc<ExpertEvent, ExpertState> {
  ExpertBloc() : super(const ExpertInitial()) {
    on<FetchHomeData>((event, emit) async {
      ExpertRepository repository = ExpertLocator().get();
      try {
        emit(HomeDataLoading(
          specialties: state.specialties,
          bestRatedExperts: state.bestRatedExperts,
          recommendedExperts: state.recommendedExperts,
          specialtyExperts: state.specialtyExperts,
          reviews: state.reviews,
          hasMedicalInfo: state.hasMedicalInfo,
        ));
        final specialtiesModel = await repository.fetchSpecialties();
        final recommendedsModel = await repository.fetchRecommendedExperts();
        final bestRatedsModel = await repository.fetchBestRatedExperts();
        emit(HomeDataSuccess(
          specialties:
              specialtiesModel.map((spec) => spec.toSpeciality()).toList(),
          bestRatedExperts:
              bestRatedsModel.map((expert) => expert.toExpert()).toList(),
          recommendedExperts:
              recommendedsModel.map((expert) => expert.toExpert()).toList(),
          specialtyExperts: state.specialtyExperts,
          reviews: state.reviews,
          hasMedicalInfo: state.hasMedicalInfo,
        ));
      } catch (e) {
        emit(ExpertError(
            specialties: state.specialties,
            bestRatedExperts: state.bestRatedExperts,
            recommendedExperts: state.recommendedExperts,
            specialtyExperts: state.specialtyExperts,
            reviews: state.reviews,
            hasMedicalInfo: state.hasMedicalInfo,
            errorMessage: e.toString()));
      }
    });
    on<FetchSpecialtyExperts>((event, emit) async {
      ExpertRepository repository = ExpertLocator().get();
      try {
        emit(SpecialityExpertLoading(
          specialties: state.specialties,
          bestRatedExperts: state.bestRatedExperts,
          recommendedExperts: state.recommendedExperts,
          specialtyExperts: state.specialtyExperts,
          reviews: state.reviews,
          hasMedicalInfo: state.hasMedicalInfo,
        ));
        final specialtyExperts = await repository.fetchSpecialtyExperts(
            event.specialty?.id, event.city?.id, event.rating, event.page);
        emit(SpecialityExpertSuccess(
          specialties: state.specialties,
          bestRatedExperts: state.bestRatedExperts,
          recommendedExperts: state.recommendedExperts,
          reviews: state.reviews,
          hasMedicalInfo: state.hasMedicalInfo,
          specialtyExperts:
              specialtyExperts.map((spec) => spec.toExpert()).toList(),
        ));
      } catch (e) {
        emit(ExpertError(
            specialties: state.specialties,
            bestRatedExperts: state.bestRatedExperts,
            recommendedExperts: state.recommendedExperts,
            specialtyExperts: state.specialtyExperts,
            reviews: state.reviews,
            hasMedicalInfo: state.hasMedicalInfo,
            errorMessage: e.toString()));
      }
    });
    on<FetchExpertReviews>((event, emit) async {
      ExpertRepository repository = ExpertLocator().get();
      try {
        emit(ExpertReviewsLoading(
          specialties: state.specialties,
          bestRatedExperts: state.bestRatedExperts,
          recommendedExperts: state.recommendedExperts,
          specialtyExperts: state.specialtyExperts,
          reviews: state.reviews,
          hasMedicalInfo: state.hasMedicalInfo,
        ));
        final reviews = await repository.getExpertReviews(event.expertId);
        emit(ExpertReviewsSuccess(
          specialties: state.specialties,
          bestRatedExperts: state.bestRatedExperts,
          recommendedExperts: state.recommendedExperts,
          reviews: reviews.map((r) => r.toReview()).toList(),
          specialtyExperts: state.specialtyExperts,
          hasMedicalInfo: state.hasMedicalInfo,
        ));
      } catch (e) {
        emit(ExpertError(
            specialties: state.specialties,
            bestRatedExperts: state.bestRatedExperts,
            recommendedExperts: state.recommendedExperts,
            specialtyExperts: state.specialtyExperts,
            reviews: state.reviews,
            hasMedicalInfo: state.hasMedicalInfo,
            errorMessage: e.toString()));
      }
    });

    on<FetchMedicalInfo>((event, emit) async {
      final MedicalInfoRepository repository = AccountLocator().get();
      try {
        emit(HasMedicalInfoLoading(
          specialties: state.specialties,
          bestRatedExperts: state.bestRatedExperts,
          recommendedExperts: state.recommendedExperts,
          specialtyExperts: state.specialtyExperts,
          reviews: state.reviews,
          hasMedicalInfo: null,
        ));
        await repository.getMedicalInfo();
        emit(
          HasMedicalInfoSuccess(
            specialties: state.specialties,
            bestRatedExperts: state.bestRatedExperts,
            recommendedExperts: state.recommendedExperts,
            reviews: state.reviews,
            hasMedicalInfo: true,
            specialtyExperts: state.specialtyExperts,
          ),
        );
      } catch (e) {
        emit(
          HasMedicalInfoSuccess(
            specialties: state.specialties,
            bestRatedExperts: state.bestRatedExperts,
            recommendedExperts: state.recommendedExperts,
            reviews: state.reviews,
            hasMedicalInfo: false,
            specialtyExperts: state.specialtyExperts,
          ),
        );
      }
    });
  }
}
