import 'package:json_annotation/json_annotation.dart';

part "reset_password_request.g.dart";

@JsonSerializable()
class ResetPasswordRequest {
  @JsonKey(name: "password")
  final String password;

  const ResetPasswordRequest({
    required this.password,
  });

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);
}
