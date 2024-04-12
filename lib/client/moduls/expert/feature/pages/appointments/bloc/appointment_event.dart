part of 'appointment_bloc.dart';

sealed class AppointmentEvent extends Equatable {
  const AppointmentEvent();

  @override
  List<Object> get props => [];
}

final class GetDayAvailabilities extends AppointmentEvent {
  final DateTime day;
  final String expertId;

  const GetDayAvailabilities({
    required this.day,
    required this.expertId,
  });
}

class SelectDate extends AppointmentEvent {
  final DayAvailability date;

  const SelectDate({required this.date});
}

class CreateAppointment extends AppointmentEvent {
  final String expertId;
  final DateTime appointmentDate;

  const CreateAppointment({
    required this.expertId,
    required this.appointmentDate,
  });
}

class FetchAllAppointments extends AppointmentEvent {}

class FetchUpcomingAppointments extends AppointmentEvent {}

class CancelAppointment extends AppointmentEvent {
  final String id;

  const CancelAppointment({required this.id});
}

final class GetRoomCode extends AppointmentEvent {
  final String appointmentId;

  const GetRoomCode({required this.appointmentId});
}
