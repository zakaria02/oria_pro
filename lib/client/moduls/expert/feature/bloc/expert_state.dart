part of 'expert_bloc.dart';

sealed class ExpertState extends Equatable {
  const ExpertState({
    required this.specialties,
    required this.bestRatedExperts,
    required this.recommendedExperts,
    required this.specialtyExperts,
    required this.reviews,
  });
  final List<Specialty> specialties;
  final List<Expert> recommendedExperts;
  final List<Expert> bestRatedExperts;
  final List<Expert> specialtyExperts;
  final List<Review> reviews;

  @override
  List<Object> get props => [
        specialties,
        recommendedExperts,
        bestRatedExperts,
        specialtyExperts,
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
        );
}

final class HomeDataLoading extends ExpertState {
  const HomeDataLoading({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required super.reviews,
  });
}

final class HomeDataSuccess extends ExpertState {
  const HomeDataSuccess({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required super.reviews,
  });
}

final class SpecialityExpertLoading extends ExpertState {
  const SpecialityExpertLoading({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required super.reviews,
  });
}

final class SpecialityExpertSuccess extends ExpertState {
  const SpecialityExpertSuccess({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required super.reviews,
  });
}

final class ExpertReviewsLoading extends ExpertState {
  const ExpertReviewsLoading({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required super.reviews,
  });
}

final class ExpertReviewsSuccess extends ExpertState {
  const ExpertReviewsSuccess({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required super.reviews,
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
    required this.errorMessage,
  });
}
