import 'package:json_annotation/json_annotation.dart';

part 'google_request_model.g.dart';

@JsonSerializable()
class GoogleRequestModel {
  final String idToken;

  const GoogleRequestModel({required this.idToken});

  factory GoogleRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GoogleRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$GoogleRequestModelToJson(this);
}
