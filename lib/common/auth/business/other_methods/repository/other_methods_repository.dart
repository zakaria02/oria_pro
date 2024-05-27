import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
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

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final result = await FirebaseAuth.instance.signInWithCredential(credential);
    log(result.toString());
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
    await FirebaseAuth.instance.signOut();
    await localDS.deleteUser();
  }
}
