import 'package:json_annotation/json_annotation.dart';

part 'cancel_appointment_request_model.g.dart';

@JsonSerializable()
class CancelAppointmentRequestModel {
  @JsonKey(name: "appointmentId")
  final String appointmentId;

  const CancelAppointmentRequestModel({required this.appointmentId});

  factory CancelAppointmentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CancelAppointmentRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CancelAppointmentRequestModelToJson(this);
}
