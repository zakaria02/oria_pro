part of 'appointment_bloc.dart';

sealed class AppointmentState extends Equatable {
  const AppointmentState({
    required this.morningAvailabilities,
    required this.selectedDate,
    required this.eveningAvailabilities,
    required this.nightAvailabilities,
  });
  final List<DayAvailability> morningAvailabilities;
  final List<DayAvailability> eveningAvailabilities;
  final List<DayAvailability> nightAvailabilities;
  final DayAvailability? selectedDate;

  @override
  List<Object?> get props => [
        morningAvailabilities,
        eveningAvailabilities,
        nightAvailabilities,
        selectedDate
      ];
}

final class AppointmentInitial extends AppointmentState {
  const AppointmentInitial()
      : super(
          morningAvailabilities: const [],
          selectedDate: null,
          eveningAvailabilities: const [],
          nightAvailabilities: const [],
        );
}

final class GetDayAvailabilityLoading extends AppointmentState {
  const GetDayAvailabilityLoading({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
    required super.nightAvailabilities,
  });
}

final class GetDayAvailabilitySuccess extends AppointmentState {
  const GetDayAvailabilitySuccess({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
    required super.nightAvailabilities,
  });
}

final class SelectDateSuccess extends AppointmentState {
  const SelectDateSuccess({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
    required super.nightAvailabilities,
  });
}

final class CreateAppointmentLoading extends AppointmentState {
  const CreateAppointmentLoading({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
    required super.nightAvailabilities,
  });
}

final class CreateAppointmentSuccess extends AppointmentState {
  final Appointment appointment;
  const CreateAppointmentSuccess({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
    required super.nightAvailabilities,
    required this.appointment,
  });
}

final class AppointmentError extends AppointmentState {
  final String errorMessage;
  const AppointmentError({
    required this.errorMessage,
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
    required super.nightAvailabilities,
  });
}
