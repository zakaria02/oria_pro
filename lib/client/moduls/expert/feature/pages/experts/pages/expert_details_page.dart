import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/experts/widgets/make_expert_appointment_card.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/experts/widgets/patient_feedback.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/widgets/oria_snack_bar.dart';

import '../../../bloc/expert_bloc.dart';

@RoutePage()
class ExpertDetailsPage extends StatefulWidget {
  const ExpertDetailsPage({
    super.key,
  });

  @override
  State<ExpertDetailsPage> createState() => _ExpertDetailsPageState();
}

class _ExpertDetailsPageState extends State<ExpertDetailsPage> {
  int maxLines = 5;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpertBloc, ExpertState>(
      listener: (context, state) {
        if (state is ExpertFavouriteSuccess && state.selectedExpert != null) {
          ScaffoldMessenger.of(context).showSnackBar(OriaSuccessSnackBar(
            content: state.selectedExpert!.isFavourite
                ? AppLocalizations.of(context)!.addedToFavorite
                : AppLocalizations.of(context)!.removeFromFavorite,
          ));
        } else if (state is ExpertError) {
          ScaffoldMessenger.of(context).showSnackBar(OriaErrorSnackBar(
              content: AppLocalizations.of(context)!.error_default));
        }
      },
      builder: (context, state) {
        return OriaScaffold(
          appBarData: AppBarData(
            firstButtonUrl: SvgAssets.backAsset,
            onFirstButtonPress: () => context.maybePop(),
            title: AppLocalizations.of(context)!.specialist,
          ),
          bottomBarPadding: EdgeInsets.zero,
          body: state is ExpertDetailsLoading || state.selectedExpert == null
              ? const OriaLoadingProgress()
              : Expanded(
                  child: ListView(
                    children: [
                      MakeExpertAppointmentCard(
                        expert: state.selectedExpert!,
                        hasMedicalInfo: state.hasMedicalInfo,
                      ),
                      if (state.selectedExpert!.bio != null) ...[
                        const SizedBox(height: 22),
                        OriaCard(
                          borderColor: OriaColors.iconButtonBackgound,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${AppLocalizations.of(context)!.about} Dr. ${state.selectedExpert!.firstName} ${state.selectedExpert!.lastName}",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: OriaColors.darkGrey,
                                    ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                state.selectedExpert!.bio!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Colors.black,
                                    ),
                                maxLines: maxLines,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Visibility(
                                visible:
                                    state.selectedExpert!.bio!.length >= 222,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      maxLines = maxLines == 5 ? 100 : 5;
                                    });
                                  },
                                  child: Text(
                                    maxLines == 5
                                        ? AppLocalizations.of(context)!.readMore
                                        : AppLocalizations.of(context)!
                                            .readLess,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: OriaColors.darkOrange,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                            if (state.reviews.isEmpty)
                              Text(
                                AppLocalizations.of(context)!.noFeedbackExpert,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Colors.black,
                                    ),
                                maxLines: maxLines,
                                overflow: TextOverflow.ellipsis,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
