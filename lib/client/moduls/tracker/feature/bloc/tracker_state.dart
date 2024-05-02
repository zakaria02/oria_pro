part of 'tracker_bloc.dart';

sealed class TrackerState extends Equatable {
  const TrackerState({required this.symptoms});

  final List<TrackedSymptom> symptoms;

  @override
  List<Object> get props => [symptoms];
}

final class TrackerInitial extends TrackerState {
  const TrackerInitial() : super(symptoms: const []);
}

final class TrackedDataLoading extends TrackerState {
  const TrackedDataLoading({required super.symptoms});
}

final class TrackedDataSuccess extends TrackerState {
  const TrackedDataSuccess({required super.symptoms});
}

final class TrackedDataError extends TrackerState {
  final String errorMessage;
  const TrackedDataError({
    required super.symptoms,
    required this.errorMessage,
  });
}
