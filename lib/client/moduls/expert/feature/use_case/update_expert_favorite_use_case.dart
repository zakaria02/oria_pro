import 'package:oria_pro/common/favourites/locator/favourite_locator.dart';
import 'package:oria_pro/common/favourites/model/favorite_request_model.dart';
import 'package:oria_pro/common/favourites/repository/favourite_repository.dart';

import '../entity/expert.dart';

class UpdateExpertFavoriteUseCase {
  FavouriteRepository repository = FavouriteLocator().get();

  Future<Expert?> execute(Expert expert) async {
    final request =
        FavoriteRequestModel(resourceId: expert.id, resourceType: "expert");
    if (expert.isFavourite) {
      await repository.removeFavorite(request);
      return expert.copyWith(isFavourite: false);
    }
    await repository.addFavorite(request);
    return expert.copyWith(isFavourite: true);
  }
}
