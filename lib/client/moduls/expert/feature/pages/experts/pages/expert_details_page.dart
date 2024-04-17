import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/expert.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/experts/widgets/make_expert_appointment_card.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/experts/widgets/patient_feedback.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../bloc/expert_bloc.dart';

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
    return BlocBuilder<ExpertBloc, ExpertState>(
      builder: (context, state) {
        return OriaScaffold(
          appBarData: AppBarData(
            firstButtonUrl: SvgAssets.backAsset,
            onFirstButtonPress: () => context.maybePop(),
            title: AppLocalizations.of(context)!.specialist,
          ),
          body: state is ExpertReviewsLoading
              ? const OriaLoadingProgress()
              : Expanded(
                  child: ListView(
                    children: [
                      MakeExpertAppointmentCard(expert: widget.expert),
                      if (widget.expert.bio != null) ...[
                        const SizedBox(height: 22),
                        OriaCard(
                          borderColor: OriaColors.iconButtonBackgound,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${AppLocalizations.of(context)!.about} Dr. ${widget.expert.firstName} ${widget.expert.lastName}",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: OriaColors.darkGrey,
                                    ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                widget.expert.bio!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: OriaColors.darkOrange,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (state.reviews.isNotEmpty) ...[
                        const SizedBox(height: 22),
                        OriaCard(
                          borderColor: OriaColors.iconButtonBackgound,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.patientsFeedbacks,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              const SizedBox(height: 16),
                              ...state.reviews.map(
                                (r) => PatientFeedback(review: r),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
        );
      },
    );
  }
}
