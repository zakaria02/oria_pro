part of 'appointment_bloc.dart';

sealed class AppointmentState extends Equatable {
  const AppointmentState({
    required this.morningAvailabilities,
    required this.selectedDate,
    required this.afternoonAvailabilities,
    required this.eveningAvailabilities,
    required this.previous,
    required this.upcoming,
    required this.currentAppointment,
  });
  final List<DayAvailability> morningAvailabilities;
  final List<DayAvailability> afternoonAvailabilities;
  final List<DayAvailability> eveningAvailabilities;
  final DayAvailability? selectedDate;
  final List<AppointmentDetails> previous;
  final List<AppointmentDetails> upcoming;
  final AppointmentDetails? currentAppointment;

  @override
  List<Object?> get props => [
        morningAvailabilities,
        afternoonAvailabilities,
        eveningAvailabilities,
        selectedDate,
        previous,
        currentAppointment,
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
          currentAppointment: null,
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
    required super.currentAppointment,
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
    required super.currentAppointment,
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
    required super.currentAppointment,
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
    required super.currentAppointment,
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
    required super.currentAppointment,
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
    required super.currentAppointment,
  });
}

final class FetchCurrentAppointmentLoading extends AppointmentState {
  const FetchCurrentAppointmentLoading({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.afternoonAvailabilities,
    required super.eveningAvailabilities,
    required super.previous,
    required super.upcoming,
    required super.currentAppointment,
  });
}

final class FetchCurrentAppointmentSuccess extends AppointmentState {
  const FetchCurrentAppointmentSuccess({
    required super.morningAvailabilities,
    required super.selectedDate,
    required super.afternoonAvailabilities,
    required super.eveningAvailabilities,
    required super.previous,
    required super.upcoming,
    required super.currentAppointment,
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
    required super.currentAppointment,
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
    required super.currentAppointment,
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
    required super.currentAppointment,
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
    required super.currentAppointment,
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
    required super.currentAppointment,
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
    required super.currentAppointment,
  });
}
