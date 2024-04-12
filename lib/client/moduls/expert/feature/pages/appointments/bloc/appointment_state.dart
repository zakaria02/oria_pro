part of 'appointment_bloc.dart';

sealed class AppointmentState extends Equatable {
  const AppointmentState({
    required this.morningAvailabilities,
    required this.selectedDate,
    required this.afternoonAvailabilities,
    required this.eveningAvailabilities,
    required this.previous,
    required this.upcoming,
  });
  final List<DayAvailability> morningAvailabilities;
  final List<DayAvailability> afternoonAvailabilities;
  final List<DayAvailability> eveningAvailabilities;
  final DayAvailability? selectedDate;
  final List<AppointmentDetails> previous;
  final List<AppointmentDetails> upcoming;

  @override
  List<Object?> get props => [
        morningAvailabilities,
        afternoonAvailabilities,
        eveningAvailabilities,
        selectedDate,
        previous,
      ];
}

final class AppointmentInitial extends AppointmentState {
  const AppointmentInitial()
      : super(
          morningAvailabilities: const [],
          selectedDate: null,
          afternoonAvailabilities: const [],
          eveningAvailabilities: const [],
          previous: const [],
          upcoming: const [],
        );
}

final class GetDayAvailabilityLoading extends AppointmentState {
  const GetDayAvailabilityLoading({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.afternoonAvailabilities,
    required super.eveningAvailabilities,
    required super.previous,
    required super.upcoming,
  });
}

final class GetDayAvailabilitySuccess extends AppointmentState {
  const GetDayAvailabilitySuccess({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.afternoonAvailabilities,
    required super.eveningAvailabilities,
    required super.previous,
    required super.upcoming,
  });
}

final class CancelAppointmentLoading extends AppointmentState {
  const CancelAppointmentLoading({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.afternoonAvailabilities,
    required super.eveningAvailabilities,
    required super.previous,
    required super.upcoming,
  });
}

final class CancelAppointmentSuccess extends AppointmentState {
  const CancelAppointmentSuccess({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.afternoonAvailabilities,
    required super.eveningAvailabilities,
    required super.previous,
    required super.upcoming,
  });
}

final class FetchAllAppointmentsLoading extends AppointmentState {
  const FetchAllAppointmentsLoading({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.afternoonAvailabilities,
    required super.eveningAvailabilities,
    required super.previous,
    required super.upcoming,
  });
}

final class FetchAllAppointmentsSuccess extends AppointmentState {
  const FetchAllAppointmentsSuccess({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.afternoonAvailabilities,
    required super.eveningAvailabilities,
    required super.previous,
    required super.upcoming,
  });
}

final class SelectDateSuccess extends AppointmentState {
  const SelectDateSuccess({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.afternoonAvailabilities,
    required super.eveningAvailabilities,
    required super.previous,
    required super.upcoming,
  });
}

final class CreateAppointmentLoading extends AppointmentState {
  const CreateAppointmentLoading({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.afternoonAvailabilities,
    required super.eveningAvailabilities,
    required super.previous,
    required super.upcoming,
  });
}

final class CreateAppointmentSuccess extends AppointmentState {
  final Appointment appointment;
  const CreateAppointmentSuccess({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.afternoonAvailabilities,
    required super.eveningAvailabilities,
    required super.previous,
    required super.upcoming,
    required this.appointment,
  });
}

final class GetRoomCodeLoading extends AppointmentState {
  const GetRoomCodeLoading({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.afternoonAvailabilities,
    required super.eveningAvailabilities,
    required super.previous,
    required super.upcoming,
  });
}

final class GetRoomCodeSuccess extends AppointmentState {
  final String roomCode;

  const GetRoomCodeSuccess({
    required this.roomCode,
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.afternoonAvailabilities,
    required super.eveningAvailabilities,
    required super.previous,
    required super.upcoming,
  });
}

final class AppointmentError extends AppointmentState {
  final String errorMessage;
  const AppointmentError({
    required this.errorMessage,
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.afternoonAvailabilities,
    required super.eveningAvailabilities,
    required super.previous,
    required super.upcoming,
  });
}
