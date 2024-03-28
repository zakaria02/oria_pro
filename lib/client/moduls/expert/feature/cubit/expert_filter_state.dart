part of 'expert_filter_cubit.dart';

class ExpertFilterState extends Equatable {
  const ExpertFilterState({required this.specialty});
  final Specialty? specialty;

  @override
  List<Object?> get props => [specialty];
}
