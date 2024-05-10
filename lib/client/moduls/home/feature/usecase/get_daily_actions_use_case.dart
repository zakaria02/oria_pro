import 'package:oria_pro/client/moduls/explore/business/di/explore_locator.dart';
import 'package:oria_pro/client/moduls/explore/business/model/learning_article.dart';
import 'package:oria_pro/client/moduls/explore/business/model/update_section_response_model.dart';
import 'package:oria_pro/client/moduls/explore/business/repository/explore_repository.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/learning_article.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/entity/symptom_program.dart';
import 'package:oria_pro/client/moduls/home/business/locator/home_locator.dart';
import 'package:oria_pro/client/moduls/home/business/model/daily_actions_model.dart';
import 'package:oria_pro/client/moduls/home/business/repository/home_repository.dart';

import '../entity/daily_actions.dart';

class GetDailyActionsUseCase {
  final ExploreRepository _exploreRepository = ExploreLocator().get();
  final HomeRepository _homeRepository = HomeLocator().get();

  Future<DailyActions> execute() async {
    final DailyActionsModel actions = await _homeRepository.getDailyActions();
    final LearningArticle article = (await _exploreRepository
            .fetchArticleContent(actions.recommendedArticle.id))
        .toArticleWithContentUio();
    final ProgramSectionWithContent section =
        (await _exploreRepository.fetchSectionDetails(
                actions.recommendedProgramSection.programId.id,
                actions.recommendedProgramSection.id))
            .toProgramSectionWithContent();
    return DailyActions(
      completedProgramSection: actions.completedProgramSection,
      readArticle: actions.readArticle,
      article: article,
      section: section,
      loggedSymptomSeverity: actions.loggedSymptomSeverity,
      loggedSeverityValue: actions.loggedSeverityValue,
    );
  }
}
