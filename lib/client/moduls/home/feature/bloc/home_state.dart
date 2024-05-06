part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState({
    required this.currentUser,
    required this.userSymptoms,
    required this.selectedSymptom,
    required this.actions,
  });
  final User? currentUser;
  final List<Symptom> userSymptoms;
  final Symptom? selectedSymptom;
  final DailyActions? actions;

  @override
  List<Object?> get props =>
      [currentUser, userSymptoms, selectedSymptom, actions];
}

final class HomeInitial extends HomeState {
  HomeInitial()
      : super(
          currentUser: null,
          userSymptoms: [],
          selectedSymptom: null,
          actions: null,
        );
}

final class FetchUserInfoLoading extends HomeState {
  const FetchUserInfoLoading({
    required super.currentUser,
    required super.userSymptoms,
    required super.selectedSymptom,
    required super.actions,
  });
}

final class FetchUserInfoSuccess extends HomeState {
  const FetchUserInfoSuccess({
    required super.currentUser,
    required super.userSymptoms,
    required super.selectedSymptom,
    required super.actions,
  });
}

final class FetchTodaysActionsLoading extends HomeState {
  const FetchTodaysActionsLoading({
    required super.currentUser,
    required super.userSymptoms,
    required super.selectedSymptom,
    required super.actions,
  });
}

final class FetchTodaysActionsSuccess extends HomeState {
  const FetchTodaysActionsSuccess({
    required super.currentUser,
    required super.userSymptoms,
    required super.selectedSymptom,
    required super.actions,
  });
}

final class FetchUserCurrentSymptomsLoading extends HomeState {
  const FetchUserCurrentSymptomsLoading({
    required super.currentUser,
    required super.userSymptoms,
    required super.selectedSymptom,
    required super.actions,
  });
}

final class FetchUserCurrentSymptomsSuccess extends HomeState {
  const FetchUserCurrentSymptomsSuccess({
    required super.currentUser,
    required super.userSymptoms,
    required super.selectedSymptom,
    required super.actions,
  });
}

final class SelectedSymptom extends HomeState {
  const SelectedSymptom({
    required super.currentUser,
    required super.userSymptoms,
    required super.selectedSymptom,
    required super.actions,
  });
}

final class HomeError extends HomeState {
  final String errorMessage;

  const HomeError({
    required this.errorMessage,
    required super.currentUser,
    required super.userSymptoms,
    required super.selectedSymptom,
    required super.actions,
  });
}
