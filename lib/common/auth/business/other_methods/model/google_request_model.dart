import 'package:json_annotation/json_annotation.dart';

part 'google_request_model.g.dart';

@JsonSerializable()
class GoogleRequestModel {
  final String idToken;
  final String deviceType;

  GoogleRequestModel({
    required this.idToken,
    required this.deviceType,
  });

  factory GoogleRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GoogleRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$GoogleRequestModelToJson(this);
}
