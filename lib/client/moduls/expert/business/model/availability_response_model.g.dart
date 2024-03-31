// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailabilityResponseModel _$AvailabilityResponseModelFromJson(
        Map<String, dynamic> json) =>
    AvailabilityResponseModel(
      hours: AvailableHours.fromJson(json['hours'] as Map<String, dynamic>),
      day: json['day'] as String,
      expertId: json['expertId'] as String,
      generalAvailability: json['generalAvailability'] as bool,
    );

Map<String, dynamic> _$AvailabilityResponseModelToJson(
        AvailabilityResponseModel instance) =>
    <String, dynamic>{
      'generalAvailability': instance.generalAvailability,
      'day': instance.day,
      'expertId': instance.expertId,
      'hours': instance.hours,
    };

AvailableHours _$AvailableHoursFromJson(Map<String, dynamic> json) =>
    AvailableHours(
      hour1: HourDetails.fromJson(json['1'] as Map<String, dynamic>),
      hour2: HourDetails.fromJson(json['2'] as Map<String, dynamic>),
      hour3: HourDetails.fromJson(json['3'] as Map<String, dynamic>),
      hour4: HourDetails.fromJson(json['4'] as Map<String, dynamic>),
      hour5: HourDetails.fromJson(json['5'] as Map<String, dynamic>),
      hour6: HourDetails.fromJson(json['6'] as Map<String, dynamic>),
      hour7: HourDetails.fromJson(json['7'] as Map<String, dynamic>),
      hour8: HourDetails.fromJson(json['8'] as Map<String, dynamic>),
      hour9: HourDetails.fromJson(json['9'] as Map<String, dynamic>),
      hour10: HourDetails.fromJson(json['10'] as Map<String, dynamic>),
      hour11: HourDetails.fromJson(json['11'] as Map<String, dynamic>),
      hour12: HourDetails.fromJson(json['12'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AvailableHoursToJson(AvailableHours instance) =>
    <String, dynamic>{
      '1': instance.hour1,
      '2': instance.hour2,
      '3': instance.hour3,
      '4': instance.hour4,
      '5': instance.hour5,
      '6': instance.hour6,
      '7': instance.hour7,
      '8': instance.hour8,
      '9': instance.hour9,
      '10': instance.hour10,
      '11': instance.hour11,
      '12': instance.hour12,
    };

HourDetails _$HourDetailsFromJson(Map<String, dynamic> json) => HourDetails(
      time: json['time'] as String,
      available: json['available'] as bool,
    );

Map<String, dynamic> _$HourDetailsToJson(HourDetails instance) =>
    <String, dynamic>{
      'time': instance.time,
      'available': instance.available,
    };
