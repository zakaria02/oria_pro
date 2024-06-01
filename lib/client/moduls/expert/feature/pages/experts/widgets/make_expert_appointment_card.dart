import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/utils/router/router.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../entity/expert.dart';

class MakeExpertAppointmentCard extends StatelessWidget {
  const MakeExpertAppointmentCard({super.key, required this.expert});

  final Expert expert;

  @override
  Widget build(BuildContext context) {
    return OriaCard(
      borderColor: OriaColors.iconButtonBackgound,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                        expert.profilePicture,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                if ((expert.rateAvarage ?? 0) > 0)
                  Container(
                    width: 55,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(
                        color: const Color(0xFFFEBD3F),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 3,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          SvgAssets.starIcon,
                          height: 14,
                          width: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          expert.rateAvarage?.toStringAsFixed(2) ?? "",
                          style: const TextStyle(
                            color: OriaColors.darkGrey,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            height: 0,
                            fontFamily: "satoshi",
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr. ${expert.firstName} ${expert.lastName}",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  expert.specialty,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: OriaColors.green,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${expert.yearsOfExperience} ${AppLocalizations.of(context)!.years}",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.grey[800],
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  "\$${expert.consultationPrice} - ${AppLocalizations.of(context)!.minutes(30)}",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 13,
                        color: const Color(0xFF43C34C),
                        fontFamily: "Satoshi",
                      ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 36,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: expert.available
                        ? () => context
                            .pushRoute(MakeAppointmentRoute(expert: expert))
                        : null,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: const Color(0xFF43C34C),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.makeAppointment,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
