import 'package:oria_pro/common/favourites/model/favorite_request_model.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/learning_article.dart';

import '../../../../../../common/favourites/locator/favourite_locator.dart';
import '../../../../../../common/favourites/repository/favourite_repository.dart';

class UpdateArticleFavoriteUseCase {
  FavouriteRepository repository = FavouriteLocator().get();

  Future<LearningArticle?> execute(LearningArticle article) async {
    final request =
        FavoriteRequestModel(resourceId: article.id, resourceType: "article");
    if (article.isFavorite) {
      await repository.removeFavorite(request);
      return article.copyWith(isFavorite: false);
    }
    await repository.addFavorite(request);
    return article.copyWith(isFavorite: true);
  }
}
