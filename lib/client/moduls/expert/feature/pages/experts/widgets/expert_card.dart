import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/expert.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/router/router.dart';
import 'package:oria_pro/widgets/oria_card.dart';

class ExpertCard extends StatelessWidget {
  const ExpertCard({super.key, required this.expert});

  final Expert expert;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(ExpertDetailsRoute(expert: expert)),
      child: OriaCard(
        width: 187,
        borderColor: OriaColors.iconButtonBackgound,
        child: Column(
          children: [
            Container(
              height: 104,
              width: 104,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    expert.profilePicture,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "${expert.firstName} ${expert.lastName}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
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
            const SizedBox(height: 8),
            Text(
              "${expert.city}, ${expert.province}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            /*Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: OriaColors.green,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                "${expert.city}, ${expert.province}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: OriaColors.green,
                    ),
                textAlign: TextAlign.center,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
