import 'package:json_annotation/json_annotation.dart';

import '../../email_password/model/token_model.dart';
import '../../email_password/model/user_model.dart';
import '../../email_password/model/user_response_model.dart';

part 'other_methodes_user_model.g.dart';

@JsonSerializable()
class OtherMethodesUserModel {
  final UserResponseModel? user;
  final UserResponseModel? newUser;
  final TokensResponseModel tokens;

  const OtherMethodesUserModel({
    required this.user,
    required this.newUser,
    required this.tokens,
  });

  factory OtherMethodesUserModel.fromJson(Map<String, dynamic> json) =>
      _$OtherMethodesUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$OtherMethodesUserModelToJson(this);
}

extension AuthResponseMappers on OtherMethodesUserModel {
  UserModel toUserModel() {
    return UserModel(
      id: user?.id ?? newUser!.id,
      email: user?.email ?? newUser!.email,
      name: user?.name ?? newUser?.name,
      role: switch (user?.role ?? newUser!.role) {
        "user" => UserRole.user,
        "pro_user" => UserRole.proUser,
        _ => UserRole.unknown,
      },
      accessToken: tokens.accessToken.token,
      accessTokenExpire: tokens.accessToken.expires,
      refreshToken: tokens.refreshToken.token,
      refreshTokenExpire: tokens.refreshToken.expires,
      hasFinishedOnboarding:
          user?.hasFinishedOnboarding ?? newUser!.hasFinishedOnboarding,
      birthDay: user?.birthDay,
      isEmailVerified: user?.isEmailVerified ?? newUser!.isEmailVerified,
      profilePicture: user?.profilePicture ?? newUser?.profilePicture,
      shareMedicalInfo: user?.shareMedicalInfo ?? newUser!.shareMedicalInfo,
    );
  }
}
