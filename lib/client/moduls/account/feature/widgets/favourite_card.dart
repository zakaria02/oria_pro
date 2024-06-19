import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_card.dart';

import '../entity/favourite.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({
    super.key,
    required this.favourite,
    required this.onRemove,
  });

  final Favourite favourite;
  final Function(Favourite) onRemove;

  @override
  Widget build(BuildContext context) {
    return OriaCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              favourite.title,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: 12),
          InkWell(
            onTap: () => onRemove(favourite),
            child: SvgPicture.asset(SvgAssets.heartFilledIcon),
          ),
        ],
      ),
    );
  }
}
