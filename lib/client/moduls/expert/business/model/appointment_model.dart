import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/entity/appointment_details.dart';

import '../../feature/entity/expert.dart';

part 'appointment_model.g.dart';

@JsonSerializable()
class AppointmentModel {
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "invoice")
  final String invoiceId;
  @JsonKey(name: "expert")
  final String expertId;
  @JsonKey(name: "user")
  final String userId;
  @JsonKey(name: "dateTime")
  final DateTime date;
  @JsonKey(name: "duration")
  final int duration;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "id")
  final String id;

  const AppointmentModel({
    required this.status,
    required this.invoiceId,
    required this.expertId,
    required this.userId,
    required this.date,
    required this.duration,
    required this.type,
    required this.id,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}

extension AppointmentModelMappers on AppointmentModel {
  AppointmentDetails toAppointment(Expert expert) {
    return AppointmentDetails(
      date: date.toLocal(),
      duration: duration,
      expert: expert,
      status: switch (status) {
        "upcoming" => AppointmentStatus.upcoming,
        "pending" => AppointmentStatus.pending,
        "missed" => AppointmentStatus.missed,
        "finished" => AppointmentStatus.finished,
        "canceled" => AppointmentStatus.canceled,
        _ => throw Exception("Appointment status not found")
      },
      id: id,
    );
  }
}
