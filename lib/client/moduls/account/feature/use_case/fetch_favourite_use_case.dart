import 'package:oria_pro/client/moduls/account/feature/entity/favourite_ressource_type.dart';
import 'package:oria_pro/common/favourites/locator/favourite_locator.dart';
import 'package:oria_pro/common/favourites/model/expert_favourite_model.dart';
import 'package:oria_pro/common/favourites/model/learning_content_favourite_model.dart';
import 'package:oria_pro/common/favourites/model/post_favourite_model.dart';
import 'package:oria_pro/common/favourites/repository/favourite_repository.dart';

import '../entity/favourite.dart';

class FetchFavouriteUseCase {
  Future<List<Favourite>> execute(FavouriteRessourceType type) async {
    final FavouriteRepository repository = FavouriteLocator().get();
    switch (type) {
      case FavouriteRessourceType.article:
        return (await repository.articleFavourites())
            .map((article) => article.toFavourite())
            .toList();
      case FavouriteRessourceType.program:
        return (await repository.programFavourites())
            .map((program) => program.toFavourite())
            .toList();
      case FavouriteRessourceType.post:
        return (await repository.postFavourites())
            .map((post) => post.toFavourite())
            .toList();
      case FavouriteRessourceType.expert:
        return (await repository.expertFavourites())
            .map((expert) => expert.toFavourite())
            .toList();
    }
  }
}
