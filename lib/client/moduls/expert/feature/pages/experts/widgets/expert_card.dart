import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/expert/feature/bloc/expert_bloc.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/expert.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/experts/pages/expert_details_page.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/widgets/oria_card.dart';

class ExpertCard extends StatelessWidget {
  const ExpertCard({super.key, required this.expert});

  final Expert expert;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ExpertBloc>(context)
            .add(FetchExpertReviews(expertId: expert.id));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (currentContext) {
              return BlocProvider.value(
                value: BlocProvider.of<ExpertBloc>(
                  context,
                ),
                child: ExpertDetailsPage(
                  expert: expert,
                ),
              );
            },
          ),
        );
      },
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
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: OriaColors.darkGrey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
