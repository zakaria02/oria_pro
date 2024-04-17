part of 'expert_bloc.dart';

sealed class ExpertEvent extends Equatable {
  const ExpertEvent();

  @override
  List<Object> get props => [];
}

final class FetchHomeData extends ExpertEvent {}

final class FetchSpecialtyExperts extends ExpertEvent {
  final Specialty? specialty;
  final City? city;
  final int? rating;
  final int page;

  const FetchSpecialtyExperts({
    required this.specialty,
    this.city,
    this.rating,
    required this.page,
  });
}

final class FetchExpertReviews extends ExpertEvent {
  final String expertId;

  const FetchExpertReviews({required this.expertId});
}
