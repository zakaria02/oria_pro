import 'package:json_annotation/json_annotation.dart';

part 'create_appointment_response_model.g.dart';

@JsonSerializable()
class CreateAppointmentResponseModel {
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "invoice")
  final String invoiceId;
  @JsonKey(name: "expert")
  final String expertId;
  @JsonKey(name: "user")
  final String userId;
  @JsonKey(name: "dateTime")
  final DateTime appointmentDate;
  @JsonKey(name: "duration")
  final int duration;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "id")
  final String id;

  const CreateAppointmentResponseModel({
    required this.status,
    required this.invoiceId,
    required this.expertId,
    required this.userId,
    required this.appointmentDate,
    required this.duration,
    required this.type,
    required this.id,
  });

  factory CreateAppointmentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateAppointmentResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateAppointmentResponseModelToJson(this);
}
