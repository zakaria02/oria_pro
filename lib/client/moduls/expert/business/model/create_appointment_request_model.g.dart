// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_appointment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAppointmentRequestModel _$CreateAppointmentRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateAppointmentRequestModel(
      expertId: json['expertId'] as String,
      appointmentDate: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$CreateAppointmentRequestModelToJson(
        CreateAppointmentRequestModel instance) =>
    <String, dynamic>{
      'expertId': instance.expertId,
      'dateTime': instance.appointmentDate.toIso8601String(),
    };
