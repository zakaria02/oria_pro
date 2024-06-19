import 'package:oria_pro/common/favourites/model/favorite_request_model.dart';
import '../../../../../../common/favourites/locator/favourite_locator.dart';
import '../../../../../../common/favourites/repository/favourite_repository.dart';
import '../entity/symptom_program.dart';

class UpdateProgramFavoriteUseCase {
  FavouriteRepository repository = FavouriteLocator().get();

  Future<SymptomProgram?> execute(SymptomProgram program) async {
    final request =
        FavoriteRequestModel(resourceId: program.id, resourceType: "program");
    if (program.isFavourite) {
      await repository.removeFavorite(request);
      return program.copyWith(isFavourite: false);
    }
    await repository.addFavorite(request);
    return program.copyWith(isFavourite: true);
  }
}
