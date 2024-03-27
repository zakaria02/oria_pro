import 'package:json_annotation/json_annotation.dart';

part 'enroll_program_request_model.g.dart';

@JsonSerializable()
class EnrollProgramRequestModel {
  @JsonKey(name: "programId")
  final String programId;

  const EnrollProgramRequestModel({required this.programId});

  factory EnrollProgramRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EnrollProgramRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$EnrollProgramRequestModelToJson(this);
}
