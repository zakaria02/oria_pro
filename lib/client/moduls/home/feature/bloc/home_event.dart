part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class GetHomeData extends HomeEvent {}

final class SelectSymptom extends HomeEvent {
  final Symptom? symptom;

  const SelectSymptom({this.symptom});
}
