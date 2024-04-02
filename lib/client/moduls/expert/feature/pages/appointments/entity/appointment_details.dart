import 'appointment.dart';

class AppointmentDetails extends Appointment {
  final AppointmentStatus status;
  final String id;

  AppointmentDetails({
    required super.date,
    required super.duration,
    required super.expert,
    required this.status,
    required this.id,
  });
}

enum AppointmentStatus { upcoming, missed, finished, canceled, pending }
