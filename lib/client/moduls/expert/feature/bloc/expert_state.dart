part of 'expert_bloc.dart';

sealed class ExpertState extends Equatable {
  const ExpertState({
    required this.specialties,
    required this.bestRatedExperts,
    required this.recommendedExperts,
    required this.specialtyExperts,
    required this.reviews,
    required this.hasMedicalInfo,
    required this.selectedExpert,
  });
  final List<Specialty> specialties;
  final List<Expert> recommendedExperts;
  final List<Expert> bestRatedExperts;
  final List<Expert> specialtyExperts;
  final List<Review> reviews;
  final bool? hasMedicalInfo;
  final Expert? selectedExpert;

  @override
  List<Object?> get props => [
        specialties,
        recommendedExperts,
        bestRatedExperts,
        specialtyExperts,
        reviews,
        hasMedicalInfo,
        selectedExpert,
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
          selectedExpert: null,
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
    required super.selectedExpert,
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
    required super.selectedExpert,
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
    required super.selectedExpert,
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
    required super.selectedExpert,
  });
}

final class ExpertDetailsLoading extends ExpertState {
  const ExpertDetailsLoading({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required super.reviews,
    required super.hasMedicalInfo,
    required super.selectedExpert,
  });
}

final class ExpertDetailsSuccess extends ExpertState {
  const ExpertDetailsSuccess({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required super.reviews,
    required super.hasMedicalInfo,
    required super.selectedExpert,
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
    required super.selectedExpert,
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
    required super.selectedExpert,
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
    required super.selectedExpert,
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
    required super.selectedExpert,
    required this.errorMessage,
  });
}
