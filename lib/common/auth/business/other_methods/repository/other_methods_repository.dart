import 'dart:io';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:oria_pro/common/auth/business/local_data_source/auth_local_data_source.dart';
import 'package:oria_pro/common/auth/business/other_methods/locator/other_methods_locator.dart';
import 'package:oria_pro/common/auth/business/other_methods/model/facebook_request_model.dart';
import 'package:oria_pro/common/auth/business/other_methods/model/google_request_model.dart';
import 'package:oria_pro/common/auth/business/other_methods/model/other_methodes_user_model.dart';

import '../../email_password/locator/email_password_locator.dart';
import '../../email_password/model/user_model.dart';
import '../service/other_methods_service.dart';

abstract class OtherMethodsRepository {
  Future<UserModel> signInWithGoogle();
  Future<void> signOutFromGoogle();
  Future<UserModel> signInWithFacebook();
  Future<void> signOutFromFacebook();
}

class OtherMethodsRepositoryImpl implements OtherMethodsRepository {
  AuthLocalDataSource localDS = EmailPasswordAuthLocator().get();
  OtherMethodsService service = OtherMethodsLocator().get();

  @override
  Future<UserModel> signInWithGoogle() async {
    await GoogleSignIn().signOut();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final user = (await service.googleSignIn(GoogleRequestModel(
      idToken: googleAuth!.idToken!,
      deviceType: Platform.isIOS ? "ios" : "android",
    )))
        .toUserModel();

    await localDS.saveUser(user);
    await OneSignal.login(user.id);

    return user;
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
    final AccessToken? accessToken = result.accessToken;
    final user = (await service.facebookSignIn(FacebookRequestModel(
      accessToken: accessToken!.token,
    )))
        .toUserModel();

    await localDS.saveUser(user);
    await OneSignal.login(user.id);

    return user;
  }

  @override
  Future<void> signOutFromFacebook() async {
    await FacebookAuth.instance.logOut();
    await localDS.deleteUser();
  }
}
