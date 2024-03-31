import 'package:json_annotation/json_annotation.dart';

part 'availability_response_model.g.dart';

@JsonSerializable()
class AvailabilityResponseModel {
  @JsonKey(name: "generalAvailability")
  final bool generalAvailability;
  @JsonKey(name: "day")
  final String day;
  @JsonKey(name: "hours")
  final AvailableHours hours;

  const AvailabilityResponseModel({
    required this.hours,
    required this.day,
    required this.generalAvailability,
  });

  factory AvailabilityResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$AvailabilityResponseModelToJson(this);
}

@JsonSerializable()
class AvailableHours {
  @JsonKey(name: "1")
  final HourDetails hour1;
  @JsonKey(name: "2")
  final HourDetails hour2;
  @JsonKey(name: "3")
  final HourDetails hour3;
  @JsonKey(name: "4")
  final HourDetails hour4;
  @JsonKey(name: "5")
  final HourDetails hour5;
  @JsonKey(name: "6")
  final HourDetails hour6;
  @JsonKey(name: "7")
  final HourDetails hour7;
  @JsonKey(name: "8")
  final HourDetails hour8;
  @JsonKey(name: "9")
  final HourDetails hour9;
  @JsonKey(name: "10")
  final HourDetails hour10;
  @JsonKey(name: "11")
  final HourDetails hour11;
  @JsonKey(name: "12")
  final HourDetails hour12;

  const AvailableHours({
    required this.hour1,
    required this.hour2,
    required this.hour3,
    required this.hour4,
    required this.hour5,
    required this.hour6,
    required this.hour7,
    required this.hour8,
    required this.hour9,
    required this.hour10,
    required this.hour11,
    required this.hour12,
  });

  factory AvailableHours.fromJson(Map<String, dynamic> json) =>
      _$AvailableHoursFromJson(json);
  Map<String, dynamic> toJson() => _$AvailableHoursToJson(this);
}

@JsonSerializable()
class HourDetails {
  @JsonKey(name: "time")
  final String time;
  @JsonKey(name: "available")
  final bool available;

  const HourDetails({required this.time, required this.available});

  factory HourDetails.fromJson(Map<String, dynamic> json) =>
      _$HourDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$HourDetailsToJson(this);
}
