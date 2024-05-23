// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_appointment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAppointmentResponseModel _$CreateAppointmentResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreateAppointmentResponseModel(
      status: json['status'] as String,
      invoiceId: json['invoice'] as String,
      expertId: json['expert'] as String,
      userId: json['user'] as String,
      appointmentDate: DateTime.parse(json['dateTime'] as String),
      duration: (json['duration'] as num).toInt(),
      type: json['type'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$CreateAppointmentResponseModelToJson(
        CreateAppointmentResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'invoice': instance.invoiceId,
      'expert': instance.expertId,
      'user': instance.userId,
      'dateTime': instance.appointmentDate.toIso8601String(),
      'duration': instance.duration,
      'type': instance.type,
      'id': instance.id,
    };
