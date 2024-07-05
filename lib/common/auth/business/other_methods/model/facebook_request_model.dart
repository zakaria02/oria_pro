import 'package:json_annotation/json_annotation.dart';

part 'facebook_request_model.g.dart';

@JsonSerializable()
class FacebookRequestModel {
  final String accessToken;

  FacebookRequestModel({
    required this.accessToken,
  });

  factory FacebookRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FacebookRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$FacebookRequestModelToJson(this);
}
