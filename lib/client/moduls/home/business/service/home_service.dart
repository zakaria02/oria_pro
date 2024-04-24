import 'package:dio/dio.dart';
import 'package:oria_pro/client/moduls/home/business/model/daily_actions_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../model/finish_action_model.dart';

part 'home_service.g.dart';

@RestApi()
abstract class HomeService {
  factory HomeService(Dio dio, {String baseUrl}) = _HomeService;

  @GET("/learning/daily-actions")
  Future<DailyActionsModel> getDailyActions();

  @POST("/learning/daily-actions/event")
  Future<void> finishAnAction(@Body() FinishActionModel request);
}
