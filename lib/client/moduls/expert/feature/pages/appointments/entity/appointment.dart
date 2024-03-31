import 'package:oria_pro/client/moduls/expert/feature/entity/expert.dart';

class Appointment {
  final DateTime date;
  final int duration;
  final Expert expert;

  const Appointment({
    required this.date,
    required this.duration,
    required this.expert,
  });
}
