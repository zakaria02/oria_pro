import 'dart:developer';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oria_pro/common/auth/business/local_data_source/auth_local_data_source.dart';

import '../../email_password/locator/email_password_locator.dart';
import '../../email_password/model/user_model.dart';

abstract class OtherMethodsRepository {
  Future<UserModel> signInWithGoogle();
  Future<void> signOutFromGoogle();
  Future<UserModel> signInWithFacebook();
  Future<void> signOutFromFacebook();
}

class OtherMethodsRepositoryImpl implements OtherMethodsRepository {
  AuthLocalDataSource localDS = EmailPasswordAuthLocator().get();

  @override
  Future<UserModel> signInWithGoogle() async {
    await GoogleSignIn().signOut();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    log("token ${googleAuth?.accessToken}");

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

  @override
  Future<UserModel> signInWithFacebook() async {
    await FacebookAuth.instance.logOut();
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      // you are logged
      final AccessToken? accessToken = result.accessToken;
      log("token ${accessToken?.token}");
    }

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
  Future<void> signOutFromFacebook() async {
    await FacebookAuth.instance.logOut();
    await localDS.deleteUser();
  }
}
