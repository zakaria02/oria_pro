import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/account/feature/entity/favorites_top_select.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../widgets/oria_top_select.dart';
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
      body: BlocProvider(
        create: (_) =>
            FavoritesNavigationCubit(FavoritesTopSelect.items(context)),
        child: BlocBuilder<FavoritesNavigationCubit, FavoritesNavigationState>(
          builder: (context, state) {
            return Expanded(
              child: Column(
                children: [
                  OriaTopBarSelect(
                    items: state.topSelectItems,
                    selectedItem: state.currentItem,
                    onItemPress: (item) =>
                        BlocProvider.of<FavoritesNavigationCubit>(context)
                            .selectItem(item),
                  ),
                  const SizedBox(height: 20),
                  Builder(
                    builder: (context) {
                      return Expanded(
                        child: Center(
                          child: Text(state.currentItem),
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
