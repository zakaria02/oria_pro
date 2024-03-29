import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/expert.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/experts/widgets/make_expert_appointment_card.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class ExpertDetailsPage extends StatefulWidget {
  const ExpertDetailsPage({
    super.key,
    required this.expert,
  });

  final Expert expert;

  @override
  State<ExpertDetailsPage> createState() => _ExpertDetailsPageState();
}

class _ExpertDetailsPageState extends State<ExpertDetailsPage> {
  int maxLines = 5;
  @override
  Widget build(BuildContext context) {
    return OriaScaffold(
      appBarData: AppBarData(
        firstButtonUrl: SvgAssets.backAsset,
        onFirstButtonPress: () => context.maybePop(),
        title: AppLocalizations.of(context)!.specialist,
      ),
      body: Expanded(
        child: ListView(
          children: [
            MakeExpertAppointmentCard(expert: widget.expert),
            const SizedBox(height: 22),
            OriaCard(
              borderColor: OriaColors.iconButtonBackgound,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${AppLocalizations.of(context)!.about} Dr. ${widget.expert.firstName} ${widget.expert.lastName}",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: OriaColors.darkGrey,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.expert.bio ??
                        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                        ),
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        maxLines = maxLines == 5 ? 100 : 5;
                      });
                    },
                    child: Text(
                      maxLines == 5
                          ? AppLocalizations.of(context)!.readMore
                          : AppLocalizations.of(context)!.readLess,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: OriaColors.darkOrange,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
