import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    this.count,
    required this.onPress,
    required this.rating,
  });

  final int? count;
  final Function(Rating?) onPress;
  final Rating? rating;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(rating),
      child: Row(
        children: [
          if (count != null) ...[
            RatingBarIndicator(
              rating: count!.toDouble(),
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: OriaColors.gold,
              ),
              itemCount: 5,
              itemSize: 25.0,
            ),
            const SizedBox(width: 8),
            Text(
              AppLocalizations.of(context)!.andUp,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
          if (count == null)
            Text(
              AppLocalizations.of(context)!.allRatings,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          const Spacer(),
          Radio<Rating>(
            activeColor: OriaColors.green,
            value: switch (count) {
              4 => Rating.rating4,
              3 => Rating.rating3,
              2 => Rating.rating2,
              _ => Rating.all,
            },
            groupValue: rating,
            onChanged: (Rating? value) => onPress(value),
          )
        ],
      ),
    );
  }
}

enum Rating { rating2, rating3, rating4, all }
