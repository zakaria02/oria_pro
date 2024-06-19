part of 'expert_bloc.dart';

sealed class ExpertState extends Equatable {
  const ExpertState({
    required this.specialties,
    required this.bestRatedExperts,
    required this.recommendedExperts,
    required this.specialtyExperts,
    required this.reviews,
    required this.hasMedicalInfo,
  });
  final List<Specialty> specialties;
  final List<Expert> recommendedExperts;
  final List<Expert> bestRatedExperts;
  final List<Expert> specialtyExperts;
  final List<Review> reviews;
  final bool? hasMedicalInfo;

  @override
  List<Object?> get props => [
        specialties,
        recommendedExperts,
        bestRatedExperts,
        specialtyExperts,
        reviews,
        hasMedicalInfo,
      ];
}

final class ExpertInitial extends ExpertState {
  const ExpertInitial()
      : super(
          specialties: const [],
          recommendedExperts: const [],
          bestRatedExperts: const [],
          specialtyExperts: const [],
          reviews: const [],
          hasMedicalInfo: null,
        );
}

final class HomeDataLoading extends ExpertState {
  const HomeDataLoading({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required super.reviews,
    required super.hasMedicalInfo,
  });
}

final class HomeDataSuccess extends ExpertState {
  const HomeDataSuccess({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required super.reviews,
    required super.hasMedicalInfo,
  });
}

final class SpecialityExpertLoading extends ExpertState {
  const SpecialityExpertLoading({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required super.reviews,
    required super.hasMedicalInfo,
  });
}

final class SpecialityExpertSuccess extends ExpertState {
  const SpecialityExpertSuccess({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required super.reviews,
    required super.hasMedicalInfo,
  });
}

final class ExpertReviewsLoading extends ExpertState {
  const ExpertReviewsLoading({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required super.reviews,
    required super.hasMedicalInfo,
  });
}

final class ExpertReviewsSuccess extends ExpertState {
  const ExpertReviewsSuccess({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required super.reviews,
    required super.hasMedicalInfo,
  });
}

final class HasMedicalInfoLoading extends ExpertState {
  const HasMedicalInfoLoading({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required super.reviews,
    required super.hasMedicalInfo,
  });
}

final class HasMedicalInfoSuccess extends ExpertState {
  const HasMedicalInfoSuccess({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required super.reviews,
    required super.hasMedicalInfo,
  });
}

final class ExpertFavouriteSuccess extends ExpertState {
  const ExpertFavouriteSuccess({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required super.reviews,
    required super.hasMedicalInfo,
  });
}

final class ExpertError extends ExpertState {
  final String errorMessage;
  const ExpertError({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required super.reviews,
    required super.hasMedicalInfo,
    required this.errorMessage,
  });
}
