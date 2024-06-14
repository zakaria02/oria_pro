import 'appointment.dart';

class AppointmentDetails extends Appointment {
  final AppointmentStatus status;
  final String id;
  final bool hasFile;

  AppointmentDetails({
    required super.date,
    required super.duration,
    required super.expert,
    required this.status,
    required this.id,
    required this.hasFile,
  });
}

enum AppointmentStatus { upcoming, missed, finished, canceled, pending }
