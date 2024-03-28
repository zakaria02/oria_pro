part of 'expert_bloc.dart';

sealed class ExpertEvent extends Equatable {
  const ExpertEvent();

  @override
  List<Object> get props => [];
}

final class FetchHomeData extends ExpertEvent {}

final class FetchSpecialtyExperts extends ExpertEvent {
  final Specialty? specialty;
  final int page;

  const FetchSpecialtyExperts({
    required this.specialty,
    required this.page,
  });
}
