import 'package:json_annotation/json_annotation.dart';

part 'update_profile_response_model.g.dart';

@JsonSerializable()
class UpdateProfileResponseModel {
  final String id;
  final String email;
  final String? name;
  final DateTime? birthDay;
  final String role;

  const UpdateProfileResponseModel({
    required this.id,
    required this.email,
    this.name,
    this.birthDay,
    required this.role,
  });

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateProfileResponseModelToJson(this);
}
