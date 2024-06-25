import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../utils/constants/svg_assets.dart';
import '../entity/favourite.dart';
import 'favourite_card.dart';

class FavouritesList extends StatelessWidget {
  final List<Favourite> items;
  final Function(Favourite) onRemove;
  final VoidCallback refresh;

  const FavouritesList({
    super.key,
    required this.items,
    required this.onRemove,
    required this.refresh,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Expanded(
        child: ListView(
          children: [
            const SizedBox(height: 60),
            SvgPicture.asset(
              SvgAssets.noResultFoundAsset,
              height: 230,
            ),
            const SizedBox(height: 45),
            Text(
              AppLocalizations.of(context)!.noResultsFound,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => FavouriteCard(
        favourite: items[index],
        onRemove: onRemove,
        refresh: refresh,
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemCount: items.length,
    );
  }
}
