import 'package:json_annotation/json_annotation.dart';

part 'update_profile_request_model.g.dart';

@JsonSerializable()
class UpdateProfileRequestModel {
  final String? name;
  final String? email;
  final String? password;
  final DateTime? birthDay;
  final bool shareMedicalInfo;
  final String? playerId;

  const UpdateProfileRequestModel({
    this.name,
    this.email,
    this.password,
    this.birthDay,
    this.shareMedicalInfo = false,
    this.playerId,
  });

  factory UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateProfileRequestModelToJson(this);
}
