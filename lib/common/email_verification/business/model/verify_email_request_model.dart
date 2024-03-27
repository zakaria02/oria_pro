import 'package:json_annotation/json_annotation.dart';

part 'verify_email_request_model.g.dart';

@JsonSerializable()
class VerifyEmailRequestModel {
  @JsonKey(name: "pin")
  final String pin;

  const VerifyEmailRequestModel(this.pin);

  factory VerifyEmailRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyEmailRequestModelToJson(this);
}
