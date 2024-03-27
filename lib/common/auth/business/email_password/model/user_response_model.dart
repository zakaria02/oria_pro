import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "role")
  final String role;
  @JsonKey(name: "hasFinishedOnboarding")
  final bool hasFinishedOnboarding;
  @JsonKey(name: "birthDay")
  final DateTime? birthDay;
  @JsonKey(name: "isEmailVerified")
  final bool isEmailVerified;
  @JsonKey(name: "profilePicture")
  final String? profilePicture;

  const UserResponseModel({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.hasFinishedOnboarding,
    required this.birthDay,
    required this.isEmailVerified,
    required this.profilePicture,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}
