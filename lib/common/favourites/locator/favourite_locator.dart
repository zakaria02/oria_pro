import 'package:get_it/get_it.dart';
import '../../../../../../utils/network/dio_builder.dart';
import '../../../../../utils/locator/abstract_locator.dart';
import '../repository/favourite_repository.dart';
import '../service/favourite_service.dart';

class FavouriteLocator extends AbstractLocator {
  static final FavouriteLocator _favouriteLocator =
      FavouriteLocator._internal();

  factory FavouriteLocator() {
    return _favouriteLocator;
  }

  FavouriteLocator._internal();

  @override
  void setUp(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<FavouriteService>(
        () => FavouriteService(DioBuilder.createDio()));
    serviceLocator.registerLazySingleton<FavouriteRepository>(
        () => FavouriteRepositoryImpl());
  }
}
