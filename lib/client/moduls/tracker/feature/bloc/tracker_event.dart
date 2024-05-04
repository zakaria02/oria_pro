part of 'tracker_bloc.dart';

sealed class TrackerEvent extends Equatable {
  const TrackerEvent();

  @override
  List<Object> get props => [];
}

final class FetchSymptomsData extends TrackerEvent {}

final class AddSymptomSeverity extends TrackerEvent {
  final String symptomId;
  final int severity;

  const AddSymptomSeverity({
    required this.symptomId,
    required this.severity,
  });
}

final class AddSymptomActivity extends TrackerEvent {
  final String activityId;
  final String logEventId;

  const AddSymptomActivity({
    required this.activityId,
    required this.logEventId,
  });
}

final class RemoveSymptomActivity extends TrackerEvent {
  final String activityId;
  final String logEventId;

  const RemoveSymptomActivity({
    required this.activityId,
    required this.logEventId,
  });
}

final class FetchActivities extends TrackerEvent {}

final class FetchLocalActivities extends TrackerEvent {}

final class UpdateLocalActivity extends TrackerEvent {
  final bool selected;
  final Activity activity;

  const UpdateLocalActivity({required this.selected, required this.activity});
}
