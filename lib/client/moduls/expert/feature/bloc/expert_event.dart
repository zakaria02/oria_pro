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

final class FetchExpert extends ExpertEvent {
  final String expertId;

  const FetchExpert({required this.expertId});
}

final class FetchMedicalInfo extends ExpertEvent {}

final class UpdateFavorite extends ExpertEvent {
  final Expert expert;

  const UpdateFavorite({required this.expert});
}
