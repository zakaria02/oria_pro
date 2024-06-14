// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      status: json['status'] as String,
      invoiceId: json['invoice'] as String,
      expertId: json['expert'] as String,
      userId: json['user'] as String,
      date: DateTime.parse(json['dateTime'] as String),
      duration: (json['duration'] as num).toInt(),
      type: json['type'] as String,
      id: json['id'] as String,
      hasFile: json['hasFile'] as bool,
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'invoice': instance.invoiceId,
      'expert': instance.expertId,
      'user': instance.userId,
      'dateTime': instance.date.toIso8601String(),
      'duration': instance.duration,
      'type': instance.type,
      'id': instance.id,
      'hasFile': instance.hasFile,
    };
