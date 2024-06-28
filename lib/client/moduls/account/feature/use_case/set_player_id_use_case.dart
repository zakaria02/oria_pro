import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:oria_pro/common/auth/business/email_password/locator/email_password_locator.dart';
import 'package:oria_pro/common/auth/business/email_password/model/update_profile_request_model.dart';
import 'package:oria_pro/common/auth/business/email_password/repository/email_password_repository.dart';

class SetPlayerIdUseCase {
  final EmailPasswordRepository _repository = EmailPasswordAuthLocator().get();
  Future<void> execute() async {
    final playerId = await OneSignal.User.getOnesignalId();

    await _repository.updateProfileInfo(UpdateProfileRequestModel(
      playerId: playerId,
    ));
  }
}
