import 'package:oria_pro/client/moduls/explore/business/di/explore_locator.dart';
import 'package:oria_pro/client/moduls/explore/business/repository/explore_repository.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/entity/program.dart';

import '../../business/locator/symptom_locator.dart';
import '../../business/repository/symptom_repository.dart';

class SetTodaysActionsProgramUseCase {
  Future<void> execute(Program program) async {
    SymptomRepository symptomRepository = SymptomLocator().get();
    ExploreRepository exploreRepository = ExploreLocator().get();

    if (program.finished == true) {
      await exploreRepository.resetProgram(program.id);
    }
    await symptomRepository.setTodaysActionsProgram(program.id);
  }
}
