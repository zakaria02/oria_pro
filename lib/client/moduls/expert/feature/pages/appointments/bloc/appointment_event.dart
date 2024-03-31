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
