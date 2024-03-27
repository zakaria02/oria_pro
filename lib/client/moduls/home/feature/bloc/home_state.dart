part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState({
    required this.currentUser,
    required this.userSymptoms,
    required this.selectedSymptom,
  });
  final User? currentUser;
  final List<Symptom> userSymptoms;
  final Symptom? selectedSymptom;

  @override
  List<Object?> get props => [currentUser, userSymptoms, selectedSymptom];
}

final class HomeInitial extends HomeState {
  HomeInitial()
      : super(
          currentUser: null,
          userSymptoms: [],
          selectedSymptom: null,
        );
}

final class GetHomeDataLoading extends HomeState {
  const GetHomeDataLoading(
      {required super.currentUser,
      required super.userSymptoms,
      required super.selectedSymptom});
}

final class GetHomeDataSuccess extends HomeState {
  const GetHomeDataSuccess(
      {required super.currentUser,
      required super.userSymptoms,
      required super.selectedSymptom});
}

final class SelectedSymptom extends HomeState {
  const SelectedSymptom(
      {required super.currentUser,
      required super.userSymptoms,
      required super.selectedSymptom});
}

final class HomeError extends HomeState {
  final String errorMessage;

  const HomeError(
      {required this.errorMessage,
      required super.currentUser,
      required super.userSymptoms,
      required super.selectedSymptom});
}
