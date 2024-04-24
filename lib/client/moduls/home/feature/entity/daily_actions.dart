import 'package:oria_pro/client/moduls/explore/feature/programs/entity/symptom_program.dart';

import '../../../explore/feature/entity/learning_article.dart';

class DailyActions {
  final bool completedProgramSection;
  final bool readArticle;
  final bool loggedSymptomSeverity;
  final LearningArticle article;
  final ProgramSectionWithContent section;

  const DailyActions({
    required this.completedProgramSection,
    required this.readArticle,
    required this.article,
    required this.section,
    required this.loggedSymptomSeverity,
  });
}
