import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:oria_pro/widgets/oria_rounded_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../../utils/constants/oria_colors.dart';
import '../../../../../../../utils/router/router.dart';
import '../../../entity/expert.dart';

class ExpertDetailedCard extends StatelessWidget {
  const ExpertDetailedCard({
    super.key,
    required this.expert,
  });

  final Expert expert;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(ExpertDetailsRoute(expert: expert)),
      child: OriaCard(
          child: Row(
        children: [
          OriaRoundedImage(
            networkImage: expert.profilePicture,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "${expert.firstName} ${expert.lastName}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      SvgAssets.starIcon,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${expert.rateAvarage ?? 4.5}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  expert.specialty,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: OriaColors.green,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgAssets.luggageIcon,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${expert.yearsOfExperience}+ ${AppLocalizations.of(context)!.years}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: OriaColors.grey,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      SvgAssets.moneyIcon,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${expert.consultationPrice}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: OriaColors.green),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
