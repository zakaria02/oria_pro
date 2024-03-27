import 'package:oria_pro/client/moduls/explore/business/model/explore_symptom_article_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/explore_symptom_program_model.dart';

import '../../business/di/explore_locator.dart';
import '../../business/repository/explore_repository.dart';
import '../entity/learning_content.dart';

class FetchLearningContentUseCase {
  ExploreRepository learningRepository = ExploreLocator().get();
  Future<List<LearningContent>> execute(bool isProgram) async {
    if (!isProgram) {
      final content = await learningRepository.fetchExploreArticles();
      return content.map((c) => c.toLearningContentUio()).toList();
    } else {
      final content = await learningRepository.fetchExplorePrograms();
      return content.map((c) => c.toLearningContentUio()).toList();
    }
  }
}
