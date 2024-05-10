import 'package:oria_pro/client/moduls/explore/business/model/explore_symptom_article_model.dart';
import 'package:oria_pro/client/moduls/explore/business/model/explore_symptom_program_model.dart';
import 'package:oria_pro/common/symptoms/business/locator/symptom_locator.dart';
import 'package:oria_pro/common/symptoms/business/repository/symptom_repository.dart';

import '../../../../../common/symptoms/business/model/user_symptom_model.dart';
import '../../business/di/explore_locator.dart';
import '../../business/repository/explore_repository.dart';
import '../entity/learning_content.dart';

class FetchLearningContentUseCase {
  final ExploreRepository _learningRepository = ExploreLocator().get();
  final SymptomRepository _symptomRepository = SymptomLocator().get();

  Future<List<LearningContent>> execute(bool isProgram) async {
    List<UserSymptomModel> userSymptoms =
        await _symptomRepository.fetchUserSymptoms();
    final String primaryId =
        userSymptoms.firstWhere((symp) => symp.type == "primary").symptom.id;
    late List<LearningContent> contentList;
    if (!isProgram) {
      final content = await _learningRepository.fetchExploreArticles();
      contentList =
          content.map((c) => c.toLearningContentUio(primaryId)).toList();
    } else {
      final content = await _learningRepository.fetchExplorePrograms();
      contentList =
          content.map((c) => c.toLearningContentUio(primaryId)).toList();
    }

    contentList.sort((a, b) {
      if (a.isPrimarySymptom && !b.isPrimarySymptom) return -1;
      if (!a.isPrimarySymptom && b.isPrimarySymptom) return 1;
      return 0;
    });

    return contentList;
  }
}
