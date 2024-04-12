import 'package:json_annotation/json_annotation.dart';

part 'meeting_access_reponse_model.g.dart';

@JsonSerializable()
class MeetingAccessResponseModel {
  @JsonKey(name: "key")
  final String key;

  const MeetingAccessResponseModel({required this.key});

  factory MeetingAccessResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MeetingAccessResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingAccessResponseModelToJson(this);
}
