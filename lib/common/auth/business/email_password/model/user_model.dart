import 'package:hive_flutter/hive_flutter.dart';
import 'package:oria_pro/utils/constants/oria_links.dart';

import '../../../../entity/user.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final UserRole role;
  @HiveField(4)
  final String accessToken;
  @HiveField(5)
  final DateTime accessTokenExpire;
  @HiveField(6)
  final String refreshToken;
  @HiveField(7)
  final DateTime refreshTokenExpire;
  @HiveField(8)
  final bool hasFinishedOnboarding;
  @HiveField(9)
  final DateTime? birthDay;
  @HiveField(10)
  final bool isEmailVerified;
  @HiveField(11)
  final String? profilePicture;
  @HiveField(12)
  final bool shareMedicalInfo;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.accessToken,
    required this.accessTokenExpire,
    required this.refreshToken,
    required this.refreshTokenExpire,
    required this.hasFinishedOnboarding,
    required this.birthDay,
    required this.isEmailVerified,
    required this.profilePicture,
    required this.shareMedicalInfo,
  });

  UserModel copyWith({
    String? email,
    String? name,
    UserRole? role,
    String? accessToken,
    DateTime? accessTokenExpire,
    String? refreshToken,
    DateTime? refreshTokenExpire,
    bool? hasFinishedOnboarding,
    DateTime? birthDay,
    bool? isEmailVerified,
    String? profilePicture,
    bool? shareMedicalInfo,
  }) =>
      UserModel(
        id: id,
        email: email ?? this.email,
        name: name ?? this.name,
        role: role ?? this.role,
        accessToken: accessToken ?? this.accessToken,
        accessTokenExpire: accessTokenExpire ?? this.accessTokenExpire,
        refreshToken: refreshToken ?? this.refreshToken,
        refreshTokenExpire: refreshTokenExpire ?? this.refreshTokenExpire,
        hasFinishedOnboarding:
            hasFinishedOnboarding ?? this.hasFinishedOnboarding,
        birthDay: birthDay ?? this.birthDay,
        isEmailVerified: isEmailVerified ?? this.isEmailVerified,
        profilePicture: profilePicture ?? this.profilePicture,
        shareMedicalInfo: shareMedicalInfo ?? this.shareMedicalInfo,
      );
}

@HiveType(typeId: 1)
enum UserRole {
  @HiveField(0)
  user,
  @HiveField(1)
  proUser,
  @HiveField(2)
  unknown,
}

extension UserModelMappers on UserModel {
  User toUser() => User(
        name: name!,
        profilePicture:
            "${OriaLinks.stagingProfileAssetsBaseUrl}/$profilePicture",
        birthDay: birthDay,
        email: email,
        shareMedicalInfo: shareMedicalInfo,
      );
}
