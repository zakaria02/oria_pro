import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/common/auth/business/email_password/model/token_model.dart';

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
      shareMedicalInfo: user.shareMedicalInfo,
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
      shareMedicalInfo: currentUser.shareMedicalInfo,
    );
  }
}
