import 'package:oria_pro/client/moduls/explore/business/di/explore_locator.dart';
import 'package:oria_pro/client/moduls/explore/business/model/favorite_request_model.dart';
import 'package:oria_pro/client/moduls/explore/business/repository/explore_repository.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/learning_article.dart';

class UpdateArticleFavoriteUseCase {
  ExploreRepository repository = ExploreLocator().get();

  Future<LearningArticle?> execute(LearningArticle article) async {
    try {
      final request =
          FavoriteRequestModel(resourceId: article.id, resourceType: "article");
      if (article.isFavorite) {
        await repository.removeFavorite(request);
        return article.copyWith(isFavorite: false);
      }
      await repository.addFavorite(request);
      return article.copyWith(isFavorite: true);
    } catch (e) {
      return null;
    }
  }
}
