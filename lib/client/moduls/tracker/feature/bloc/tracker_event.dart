part of 'tracker_bloc.dart';

sealed class TrackerEvent extends Equatable {
  const TrackerEvent();

  @override
  List<Object> get props => [];
}

final class FetchSymptomsData extends TrackerEvent {}
