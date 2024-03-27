import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/onbaording_answer_model.dart';
import '../model/onboarding_question_model.dart';

part 'onboarding_service.g.dart';

@RestApi()
abstract class OnBoardingService {
  factory OnBoardingService(Dio dio, {String baseUrl}) = _OnBoardingService;

  @GET("/onboarding")
  Future<List<OnBoardingQuestionModel>> fetchOnBoardingQuestions();

  @POST("/onboarding/answer")
  Future<OnBoardingAnswerModel> addAnswer(
      @Body() OnBoardingAnswerModel request);
}
