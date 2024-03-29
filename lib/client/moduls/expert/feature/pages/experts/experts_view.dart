import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/experts/widgets/expert_card.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_snack_bar.dart';

import '../../bloc/expert_bloc.dart';
import 'widgets/specialty_card.dart';

class ExpertsView extends StatelessWidget {
  const ExpertsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpertBloc()..add(FetchHomeData()),
      child: BlocConsumer<ExpertBloc, ExpertState>(
        listener: (context, state) {
          if (state is ExpertError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(OriaErrorSnackBar(content: state.errorMessage));
          }
        },
        builder: (expertBlocContext, state) {
          return state is HomeDataLoading
              ? const OriaLoadingProgress()
              : Expanded(
                  child: ListView(
                    children: [
                      if (state.specialties.isNotEmpty) ...[
                        Text(
                          AppLocalizations.of(context)!.findBySpeciality,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 18,
                                  ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 145,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => SpecialtyCard(
                              specialty: state.specialties[index],
                              blocContext: expertBlocContext,
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 12),
                            itemCount: state.specialties.length,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          AppLocalizations.of(context)!.recommended,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 18,
                                  ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 235,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => ExpertCard(
                              expert: state.recommendedExperts[index],
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 12),
                            itemCount: state.recommendedExperts.length,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          AppLocalizations.of(context)!.bestRated,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 18,
                                  ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 235,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => ExpertCard(
                              expert: state.bestRatedExperts[index],
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 12),
                            itemCount: state.bestRatedExperts.length,
                          ),
                        ),
                      ]
                    ],
                  ),
                );
        },
      ),
    );
  }
}
