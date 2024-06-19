import 'package:oria_pro/common/favourites/locator/favourite_locator.dart';
import 'package:oria_pro/common/favourites/service/favourite_service.dart';

import '../model/expert_favourite_model.dart';
import '../model/favorite_request_model.dart';
import '../model/learning_content_favourite_model.dart';
import '../model/post_favourite_model.dart';

abstract class FavouriteRepository {
  Future<void> addFavorite(FavoriteRequestModel request);
  Future<void> removeFavorite(FavoriteRequestModel request);
  Future<List<LearningContentFavouriteModel>> articleFavourites();
  Future<List<ExpertFavouriteModel>> expertFavourites();
  Future<List<PostFavouriteModel>> postFavourites();
  Future<List<LearningContentFavouriteModel>> programFavourites();
}

class FavouriteRepositoryImpl extends FavouriteRepository {
  FavouriteService service = FavouriteLocator().get();
  @override
  Future<void> addFavorite(FavoriteRequestModel request) {
    return service.addFavorite(request);
  }

  @override
  Future<void> removeFavorite(FavoriteRequestModel request) {
    return service.removeFavorite(request);
  }

  @override
  Future<List<LearningContentFavouriteModel>> articleFavourites() {
    return service.articleFavourites();
  }

  @override
  Future<List<ExpertFavouriteModel>> expertFavourites() {
    return service.expertFavourites();
  }

  @override
  Future<List<PostFavouriteModel>> postFavourites() {
    return service.postFavourites();
  }

  @override
  Future<List<LearningContentFavouriteModel>> programFavourites() {
    return service.programFavourites();
  }
}
