part of 'expert_bloc.dart';

sealed class ExpertState extends Equatable {
  const ExpertState({
    required this.specialties,
    required this.bestRatedExperts,
    required this.recommendedExperts,
    required this.specialtyExperts,
  });
  final List<Specialty> specialties;
  final List<Expert> recommendedExperts;
  final List<Expert> bestRatedExperts;
  final List<Expert> specialtyExperts;

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
        );
}

final class HomeDataLoading extends ExpertState {
  const HomeDataLoading({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
  });
}

final class HomeDataSuccess extends ExpertState {
  const HomeDataSuccess({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
  });
}

final class SpecialityExpertLoading extends ExpertState {
  const SpecialityExpertLoading({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
  });
}

final class SpecialityExpertSuccess extends ExpertState {
  const SpecialityExpertSuccess({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
  });
}

final class ExpertError extends ExpertState {
  final String errorMessage;
  const ExpertError({
    required super.specialties,
    required super.bestRatedExperts,
    required super.recommendedExperts,
    required super.specialtyExperts,
    required this.errorMessage,
  });
}
