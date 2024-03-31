import 'package:json_annotation/json_annotation.dart';

part 'create_appointment_request_model.g.dart';

@JsonSerializable()
class CreateAppointmentRequestModel {
  @JsonKey(name: "expertId")
  final String expertId;
  @JsonKey(name: "dateTime")
  final DateTime appointmentDate;

  const CreateAppointmentRequestModel({
    required this.expertId,
    required this.appointmentDate,
  });

  factory CreateAppointmentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateAppointmentRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateAppointmentRequestModelToJson(this);
}
