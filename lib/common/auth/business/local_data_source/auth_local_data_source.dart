import 'package:hive_flutter/hive_flutter.dart';
import 'package:oria_pro/utils/locator/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/constants/oria_links.dart';
import '../email_password/model/user_model.dart';

class AuthLocalDataSource {
  Future<void> saveUser(UserModel user) async {
    Box<UserModel> box = await Hive.openBox<UserModel>(OriaLinks.userHiveBox);
    final SharedPreferences prefs = AppLocator().get();
    if (box.isOpen) {
      await box.clear();
      prefs.remove("token");
      await box.put(user.id, user).whenComplete(() async {
        await box.close();
      });
      prefs.setString("token", user.accessToken);
    }
  }

  Future<UserModel?> getUser() async {
    Box<UserModel> box = await Hive.openBox<UserModel>(OriaLinks.userHiveBox);
    if (box.isOpen) {
      UserModel? user = box.values.toList().firstOrNull;
      await box.close();
      return user;
    }
    return null;
  }

  Future<void> deleteUser() async {
    Box<UserModel> box = await Hive.openBox<UserModel>(OriaLinks.userHiveBox);
    if (box.isOpen) {
      await box.clear().whenComplete(() async {
        await box.close();
      });
    }
  }
}
