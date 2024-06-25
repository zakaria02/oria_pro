import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/account/feature/entity/favorites_top_select.dart';
import 'package:oria_pro/client/moduls/account/feature/entity/favourite_ressource_type.dart';
import 'package:oria_pro/client/moduls/account/feature/widgets/favourites_list.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../widgets/oria_top_select.dart';
import '../bloc/user_bloc.dart';
import '../cubit/favorites_navigation_cubit.dart';

@RoutePage()
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OriaScaffold(
      appBarData: AppBarData(
        firstButtonUrl: SvgAssets.backAsset,
        onFirstButtonPress: () => context.maybePop(),
        title: AppLocalizations.of(context)!.favorites,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                FavoritesNavigationCubit(FavoritesTopSelect.items(context)),
          ),
          BlocProvider(
            create: (context) => UserBloc()
              ..add(
                const FetchFavourite(
                  type: FavouriteRessourceType.expert,
                ),
              ),
          ),
        ],
        child: BlocBuilder<FavoritesNavigationCubit, FavoritesNavigationState>(
          builder: (favouriteContext, favouriteState) {
            return BlocBuilder<UserBloc, UserState>(
              builder: (userContext, userState) {
                return Expanded(
                  child: Column(
                    children: [
                      OriaTopBarSelect(
                        items: favouriteState.topSelectItems,
                        selectedItem: favouriteState.currentItem,
                        fontSize: 12,
                        onItemPress: (item) {
                          final favouritesNavigationCubit =
                              BlocProvider.of<FavoritesNavigationCubit>(
                                  favouriteContext);
                          final userBloc =
                              BlocProvider.of<UserBloc>(userContext);

                          favouritesNavigationCubit.selectItem(item);

                          final appLocalizations =
                              AppLocalizations.of(context)!;

                          if (item == appLocalizations.experts) {
                            userBloc.add(const FetchFavourite(
                                type: FavouriteRessourceType.expert));
                          } else if (item == appLocalizations.learn) {
                            userBloc.add(const FetchFavourite(
                                type: FavouriteRessourceType.article));
                          } else if (item == appLocalizations.programs) {
                            userBloc.add(const FetchFavourite(
                                type: FavouriteRessourceType.program));
                          } else if (item == appLocalizations.posts("")) {
                            userBloc.add(const FetchFavourite(
                                type: FavouriteRessourceType.post));
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      if (userState is FavouriteLoading)
                        const OriaLoadingProgress(),
                      const SizedBox(height: 10),
                      switch (userState.ressourceType) {
                        FavouriteRessourceType.article => FavouritesList(
                            onRemove: (fav) {
                              BlocProvider.of<UserBloc>(userContext).add(
                                RemoveFavourite(
                                    ressourceId: fav.resourceId,
                                    ressourceType: fav.resourceType),
                              );
                            },
                            refresh: () {
                              BlocProvider.of<UserBloc>(userContext).add(
                                  const FetchFavourite(
                                      type: FavouriteRessourceType.article));
                            },
                            items: userState.articleFavourites),
                        FavouriteRessourceType.expert => FavouritesList(
                            onRemove: (fav) {
                              BlocProvider.of<UserBloc>(userContext).add(
                                RemoveFavourite(
                                    ressourceId: fav.resourceId,
                                    ressourceType: fav.resourceType),
                              );
                            },
                            refresh: () {
                              BlocProvider.of<UserBloc>(userContext).add(
                                  const FetchFavourite(
                                      type: FavouriteRessourceType.expert));
                            },
                            items: userState.expertFavourites),
                        FavouriteRessourceType.program => FavouritesList(
                            onRemove: (fav) {
                              BlocProvider.of<UserBloc>(userContext).add(
                                RemoveFavourite(
                                    ressourceId: fav.resourceId,
                                    ressourceType: fav.resourceType),
                              );
                            },
                            refresh: () {
                              BlocProvider.of<UserBloc>(userContext).add(
                                  const FetchFavourite(
                                      type: FavouriteRessourceType.program));
                            },
                            items: userState.programFavourites),
                        FavouriteRessourceType.post => FavouritesList(
                            onRemove: (fav) {
                              BlocProvider.of<UserBloc>(userContext).add(
                                RemoveFavourite(
                                    ressourceId: fav.resourceId,
                                    ressourceType: fav.resourceType),
                              );
                            },
                            refresh: () {
                              BlocProvider.of<UserBloc>(userContext).add(
                                  const FetchFavourite(
                                      type: FavouriteRessourceType.post));
                            },
                            items: userState.postFavourites),
                      },
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
