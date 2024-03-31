part of 'appointment_bloc.dart';

sealed class AppointmentState extends Equatable {
  const AppointmentState({
    required this.morningAvailabilities,
    required this.selectedDate,
    required this.eveningAvailabilities,
  });
  final List<DayAvailability> morningAvailabilities;
  final List<DayAvailability> eveningAvailabilities;
  final DayAvailability? selectedDate;

  @override
  List<Object?> get props => [morningAvailabilities, selectedDate];
}

final class AppointmentInitial extends AppointmentState {
  const AppointmentInitial()
      : super(
          morningAvailabilities: const [],
          selectedDate: null,
          eveningAvailabilities: const [],
        );
}

final class GetDayAvailabilityLoading extends AppointmentState {
  const GetDayAvailabilityLoading({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
  });
}

final class GetDayAvailabilitySuccess extends AppointmentState {
  const GetDayAvailabilitySuccess({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
  });
}

final class SelectDateSuccess extends AppointmentState {
  const SelectDateSuccess({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
  });
}

final class AppointmentError extends AppointmentState {
  final String errorMessage;
  const AppointmentError({
    required this.errorMessage,
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
  });
}
