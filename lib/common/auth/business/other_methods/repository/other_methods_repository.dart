import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:oria_pro/common/auth/business/local_data_source/auth_local_data_source.dart';

import '../../email_password/locator/email_password_locator.dart';
import '../../email_password/model/user_model.dart';

abstract class OtherMethodsRepository {
  Future<UserModel> signInWithGoogle();
  Future<void> signOutFromGoogle();
}

class OtherMethodsRepositoryImpl implements OtherMethodsRepository {
  AuthLocalDataSource localDS = EmailPasswordAuthLocator().get();

  @override
  Future<UserModel> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    log("token ${googleAuth?.idToken}");

    return UserModel(
      id: "id",
      email: "email",
      name: 'name',
      role: UserRole.proUser,
      accessToken: "accessToken",
      accessTokenExpire: DateTime.now(),
      refreshToken: "refreshToken",
      refreshTokenExpire: DateTime.now(),
      hasFinishedOnboarding: true,
      birthDay: DateTime.now(),
      isEmailVerified: true,
      profilePicture: '',
      shareMedicalInfo: true,
    );
  }

  @override
  Future<void> signOutFromGoogle() async {
    await GoogleSignIn().signOut();
    await localDS.deleteUser();
  }
}
