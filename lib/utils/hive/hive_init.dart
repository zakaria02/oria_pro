import 'package:hive_flutter/hive_flutter.dart';

import '../../client/moduls/tracker/business/model/selectable_activity_model.dart';
import '../../common/auth/business/email_password/model/user_model.dart';
import '../local_storage/app_path_provider.dart';

void initHive() {
  Hive
    ..init(AppPathProvider.path)
    ..registerAdapter(UserModelAdapter())
    ..registerAdapter(UserRoleAdapter())
    ..registerAdapter(SelectableActivityModelAdapter());
}
