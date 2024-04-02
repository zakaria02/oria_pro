part of 'appointment_bloc.dart';

sealed class AppointmentState extends Equatable {
  const AppointmentState({
    required this.morningAvailabilities,
    required this.selectedDate,
    required this.eveningAvailabilities,
    required this.nightAvailabilities,
    required this.appointments,
  });
  final List<DayAvailability> morningAvailabilities;
  final List<DayAvailability> eveningAvailabilities;
  final List<DayAvailability> nightAvailabilities;
  final DayAvailability? selectedDate;
  final List<AppointmentDetails> appointments;

  @override
  List<Object?> get props => [
        morningAvailabilities,
        eveningAvailabilities,
        nightAvailabilities,
        selectedDate,
        appointments,
      ];
}

final class AppointmentInitial extends AppointmentState {
  const AppointmentInitial()
      : super(
          morningAvailabilities: const [],
          selectedDate: null,
          eveningAvailabilities: const [],
          nightAvailabilities: const [],
          appointments: const [],
        );
}

final class GetDayAvailabilityLoading extends AppointmentState {
  const GetDayAvailabilityLoading({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
    required super.nightAvailabilities,
    required super.appointments,
  });
}

final class GetDayAvailabilitySuccess extends AppointmentState {
  const GetDayAvailabilitySuccess({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
    required super.nightAvailabilities,
    required super.appointments,
  });
}

final class CancelAppointmentLoading extends AppointmentState {
  const CancelAppointmentLoading({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
    required super.nightAvailabilities,
    required super.appointments,
  });
}

final class CancelAppointmentSuccess extends AppointmentState {
  const CancelAppointmentSuccess({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
    required super.nightAvailabilities,
    required super.appointments,
  });
}

final class FetchAllAppointmentsLoading extends AppointmentState {
  const FetchAllAppointmentsLoading({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
    required super.nightAvailabilities,
    required super.appointments,
  });
}

final class FetchAllAppointmentsSuccess extends AppointmentState {
  const FetchAllAppointmentsSuccess({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
    required super.nightAvailabilities,
    required super.appointments,
  });
}

final class SelectDateSuccess extends AppointmentState {
  const SelectDateSuccess({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
    required super.nightAvailabilities,
    required super.appointments,
  });
}

final class CreateAppointmentLoading extends AppointmentState {
  const CreateAppointmentLoading({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
    required super.nightAvailabilities,
    required super.appointments,
  });
}

final class CreateAppointmentSuccess extends AppointmentState {
  final Appointment appointment;
  const CreateAppointmentSuccess({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.eveningAvailabilities,
    required super.nightAvailabilities,
    required super.appointments,
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
    required super.appointments,
  });
}
