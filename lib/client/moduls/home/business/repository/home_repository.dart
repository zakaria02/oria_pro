import 'package:oria_pro/client/moduls/home/business/locator/home_locator.dart';
import 'package:oria_pro/client/moduls/home/business/model/daily_actions_model.dart';
import 'package:oria_pro/client/moduls/home/business/model/finish_action_model.dart';
import 'package:oria_pro/client/moduls/home/business/service/home_service.dart';

abstract class HomeRepository {
  Future<DailyActionsModel> getDailyActions();
  Future<void> finishAnAction(FinishActionModel request);
}

class HomeRepositoryImpl extends HomeRepository {
  final HomeService _service = HomeLocator().get<HomeService>();
  @override
  Future<DailyActionsModel> getDailyActions() {
    return _service.getDailyActions();
  }

  @override
  Future<void> finishAnAction(FinishActionModel request) {
    return _service.finishAnAction(request);
  }
}
