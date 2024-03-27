import 'package:json_annotation/json_annotation.dart';

import 'user_model.dart';
import 'user_response_model.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  @JsonKey(name: "user")
  final UserResponseModel user;
  @JsonKey(name: "tokens")
  final TokensResponseModel tokens;

  const AuthResponseModel({
    required this.user,
    required this.tokens,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);
}

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

extension AuthResponseMappers on AuthResponseModel {
  UserModel toUserModel() {
    return UserModel(
      id: user.id,
      email: user.email,
      name: user.name,
      role: switch (user.role) {
        "user" => UserRole.user,
        "pro_user" => UserRole.proUser,
        _ => UserRole.unknown,
      },
      accessToken: tokens.accessToken.token,
      accessTokenExpire: tokens.accessToken.expires,
      refreshToken: tokens.refreshToken.token,
      refreshTokenExpire: tokens.refreshToken.expires,
      hasFinishedOnboarding: user.hasFinishedOnboarding,
      birthDay: user.birthDay,
      isEmailVerified: user.isEmailVerified,
      profilePicture: user.profilePicture,
    );
  }
}

extension UserResponseModelMappers on UserResponseModel {
  UserModel toUserModel(UserModel currentUser) {
    return UserModel(
      id: id,
      email: email,
      name: name,
      role: switch (role) {
        "user" => UserRole.user,
        "pro_user" => UserRole.proUser,
        _ => UserRole.unknown,
      },
      accessToken: currentUser.accessToken,
      accessTokenExpire: currentUser.accessTokenExpire,
      refreshToken: currentUser.refreshToken,
      refreshTokenExpire: currentUser.refreshTokenExpire,
      hasFinishedOnboarding: hasFinishedOnboarding,
      birthDay: birthDay,
      isEmailVerified: currentUser.isEmailVerified,
      profilePicture: currentUser.profilePicture,
    );
  }
}
