part of 'tracker_bloc.dart';

sealed class TrackerState extends Equatable {
  const TrackerState({
    required this.symptoms,
    required this.activities,
    required this.savedActivities,
  });

  final List<TrackedSymptom> symptoms;
  final List<Activity> activities;
  final List<Activity> savedActivities;

  @override
  List<Object> get props => [symptoms, activities, savedActivities];
}

final class TrackerInitial extends TrackerState {
  const TrackerInitial()
      : super(
            symptoms: const [],
            activities: const [],
            savedActivities: const []);
}

final class TrackedDataLoading extends TrackerState {
  const TrackedDataLoading({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
  });
}

final class TrackedDataSuccess extends TrackerState {
  const TrackedDataSuccess({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
  });
}

final class AddSymptomSeverityLoading extends TrackerState {
  const AddSymptomSeverityLoading({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
  });
}

final class AddSymptomSeveritySuccess extends TrackerState {
  const AddSymptomSeveritySuccess({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
  });
}

final class AddSymptomActivityLoading extends TrackerState {
  const AddSymptomActivityLoading({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
  });
}

final class AddSymptomActivitySuccess extends TrackerState {
  const AddSymptomActivitySuccess({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
  });
}

final class FetchActivitiesLoading extends TrackerState {
  const FetchActivitiesLoading(
      {required List<TrackedSymptom> symptoms, required savedActivities})
      : super(
          symptoms: symptoms,
          activities: const [],
          savedActivities: savedActivities,
        );
}

final class FetchActivitiesSuccess extends TrackerState {
  const FetchActivitiesSuccess({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
  });
}

final class FetchLocalActivitiesLoading extends TrackerState {
  const FetchLocalActivitiesLoading(
      {required List<TrackedSymptom> symptoms,
      required List<Activity> activities})
      : super(
          symptoms: symptoms,
          activities: activities,
          savedActivities: const [],
        );
}

final class FetchLocalActivitiesSuccess extends TrackerState {
  const FetchLocalActivitiesSuccess({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
  });
}

final class TrackedDataError extends TrackerState {
  final String errorMessage;
  const TrackedDataError({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
    required this.errorMessage,
  });
}
