part of 'tracker_bloc.dart';

sealed class TrackerState extends Equatable {
  const TrackerState({
    required this.symptoms,
    required this.activities,
    required this.savedActivities,
    required this.selectedDate,
    required this.insights,
  });

  final List<TrackedSymptom> symptoms;
  final List<Activity> activities;
  final List<Activity> savedActivities;
  final String selectedDate;
  final Insights? insights;

  @override
  List<Object> get props =>
      [symptoms, activities, savedActivities, selectedDate];
}

final class TrackerInitial extends TrackerState {
  const TrackerInitial()
      : super(
          symptoms: const [],
          activities: const [],
          savedActivities: const [],
          selectedDate: "",
          insights: null,
        );
}

final class TrackedDataLoading extends TrackerState {
  const TrackedDataLoading({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
    required super.selectedDate,
    required super.insights,
  });
}

final class TrackedDataSuccess extends TrackerState {
  const TrackedDataSuccess({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
    required super.selectedDate,
    required super.insights,
  });
}

final class AddSymptomSeverityLoading extends TrackerState {
  const AddSymptomSeverityLoading({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
    required super.selectedDate,
    required super.insights,
  });
}

final class AddSymptomSeveritySuccess extends TrackerState {
  const AddSymptomSeveritySuccess({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
    required super.selectedDate,
    required super.insights,
  });
}

final class AddSymptomActivityLoading extends TrackerState {
  const AddSymptomActivityLoading({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
    required super.selectedDate,
    required super.insights,
  });
}

final class AddSymptomActivitySuccess extends TrackerState {
  const AddSymptomActivitySuccess({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
    required super.selectedDate,
    required super.insights,
  });
}

final class FetchActivitiesLoading extends TrackerState {
  const FetchActivitiesLoading({
    required List<TrackedSymptom> symptoms,
    required savedActivities,
    required String selectedDate,
    required Insights? insights,
  }) : super(
          symptoms: symptoms,
          activities: const [],
          savedActivities: savedActivities,
          selectedDate: selectedDate,
          insights: insights,
        );
}

final class FetchActivitiesSuccess extends TrackerState {
  const FetchActivitiesSuccess({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
    required super.selectedDate,
    required super.insights,
  });
}

final class FetchLocalActivitiesLoading extends TrackerState {
  const FetchLocalActivitiesLoading({
    required List<TrackedSymptom> symptoms,
    required List<Activity> activities,
    required String selectedDate,
    required Insights? insights,
  }) : super(
          symptoms: symptoms,
          activities: activities,
          savedActivities: const [],
          selectedDate: selectedDate,
          insights: insights,
        );
}

final class FetchLocalActivitiesSuccess extends TrackerState {
  const FetchLocalActivitiesSuccess({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
    required super.selectedDate,
    required super.insights,
  });
}

final class GetInsightsLoading extends TrackerState {
  const GetInsightsLoading({
    required List<TrackedSymptom> symptoms,
    required List<Activity> activities,
    required String selectedDate,
    required Insights? insights,
  }) : super(
          symptoms: symptoms,
          activities: activities,
          savedActivities: const [],
          selectedDate: selectedDate,
          insights: insights,
        );
}

final class GetInsightsSuccess extends TrackerState {
  const GetInsightsSuccess({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
    required super.selectedDate,
    required super.insights,
  });
}

final class TrackedDataError extends TrackerState {
  final String errorMessage;
  const TrackedDataError({
    required super.symptoms,
    required super.activities,
    required super.savedActivities,
    required super.selectedDate,
    required super.insights,
    required this.errorMessage,
  });
}
