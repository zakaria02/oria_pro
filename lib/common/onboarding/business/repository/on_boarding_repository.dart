import '../locator/onboarding_lcoator.dart';
import '../model/onbaording_answer_model.dart';
import '../model/onboarding_question_model.dart';
import '../service/onboarding_service.dart';

abstract class OnBoardingRepository {
  Future<List<OnBoardingQuestionModel>> fetchOnBoardingQuestions();
  Future<OnBoardingAnswerModel> addAnswer(String questionId, String answerId);
}

class OnBoardingRepositoryImpl extends OnBoardingRepository {
  final OnBoardingService service = OnBoardingLocator().get();

  @override
  Future<List<OnBoardingQuestionModel>> fetchOnBoardingQuestions() {
    return service.fetchOnBoardingQuestions();
  }

  @override
  Future<OnBoardingAnswerModel> addAnswer(String questionId, String answerId) {
    return service.addAnswer(OnBoardingAnswerModel(questionId, [answerId]));
  }
}
