import 'package:json_annotation/json_annotation.dart';

part 'update_section_request_model.g.dart';

@JsonSerializable()
class UpdateSectionRequestModel {
  @JsonKey(name: "programId")
  final String programId;
  @JsonKey(name: "sectionId")
  final String sectionId;
  @JsonKey(name: "status")
  final String status;

  const UpdateSectionRequestModel({
    required this.programId,
    required this.sectionId,
    required this.status,
  });

  factory UpdateSectionRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateSectionRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateSectionRequestModelToJson(this);
}
