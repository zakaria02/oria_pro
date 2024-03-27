import 'package:oria_pro/client/moduls/explore/business/di/explore_locator.dart';
import 'package:oria_pro/client/moduls/explore/business/model/update_section_request_model.dart';
import 'package:oria_pro/client/moduls/explore/business/repository/explore_repository.dart';

class FinishSectionUseCase {
  ExploreRepository repository = ExploreLocator().get();

  Future<bool> execute(String programId, String sectionId) async {
    try {
      await repository.updateSection(
        UpdateSectionRequestModel(
          programId: programId,
          sectionId: sectionId,
          status: "finished",
        ),
      );

      return true;
    } catch (e) {
      return false;
    }
  }
}
