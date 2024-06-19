import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../model/expert_favourite_model.dart';
import '../model/favorite_request_model.dart';
import '../model/learning_content_favourite_model.dart';
import '../model/post_favourite_model.dart';

part 'favourite_service.g.dart';

@RestApi()
abstract class FavouriteService {
  factory FavouriteService(Dio dio, {String baseUrl}) = _FavouriteService;
  @POST("/users/favourite")
  Future<void> addFavorite(@Body() FavoriteRequestModel request);

  @DELETE("/users/favourite")
  Future<void> removeFavorite(@Body() FavoriteRequestModel request);

  @GET("/users/favourites?type=article")
  Future<List<LearningContentFavouriteModel>> articleFavourites();

  @GET("/users/favourites?type=expert")
  Future<List<ExpertFavouriteModel>> expertFavourites();

  @GET("/users/favourites?type=post")
  Future<List<PostFavouriteModel>> postFavourites();

  @GET("/users/favourites?type=program")
  Future<List<LearningContentFavouriteModel>> programFavourites();
}
