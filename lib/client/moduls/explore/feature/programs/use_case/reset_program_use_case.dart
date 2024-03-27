import 'package:oria_pro/client/moduls/explore/business/di/explore_locator.dart';
import 'package:oria_pro/client/moduls/explore/business/repository/explore_repository.dart';

class ResetProgramUseCase {
  final ExploreRepository repository = ExploreLocator().get();

  Future<bool> execute(String programId) async {
    try {
      await repository.resetProgram(programId);
      return true;
    } catch (e) {
      return false;
    }
  }
}
