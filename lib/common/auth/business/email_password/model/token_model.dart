import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenResponseModel {
  @JsonKey(name: "token")
  final String token;
  @JsonKey(name: "expires")
  final DateTime expires;

  const TokenResponseModel({required this.token, required this.expires});

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$TokenResponseModelToJson(this);
}

@JsonSerializable()
class TokensResponseModel {
  @JsonKey(name: "access")
  final TokenResponseModel accessToken;
  @JsonKey(name: "refresh")
  final TokenResponseModel refreshToken;

  const TokensResponseModel(
      {required this.accessToken, required this.refreshToken});

  factory TokensResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TokensResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$TokensResponseModelToJson(this);
}
