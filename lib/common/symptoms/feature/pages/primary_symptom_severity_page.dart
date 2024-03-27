import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/bloc/programs_bloc.dart';
import 'package:oria_pro/common/symptoms/feature/widgets/severity_card.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../utils/constants/svg_assets.dart';
import '../../../../utils/router/router.dart';
import '../../../../widgets/oria_app_bar.dart';
import '../../../../widgets/oria_rounded_button.dart';
import '../../../../widgets/oria_snack_bar.dart';
import '../../../onboarding/feature/cubit/onboarding_steps_cubit.dart';

class PrimarySymptomSeverityPage extends StatefulWidget {
  const PrimarySymptomSeverityPage({
    super.key,
    required this.onboardingStepsCubit,
  });

  final OnboardingStepsCubit onboardingStepsCubit;

  @override
  State<PrimarySymptomSeverityPage> createState() =>
      _PrimarySymptomSeverityPageState();
}

class _PrimarySymptomSeverityPageState
    extends State<PrimarySymptomSeverityPage> {
  int? selectedSeverity;
  @override
  Widget build(BuildContext context) {
    final router = context.router;
    return OriaScaffold(
      appBarData: AppBarData(
        firstButtonUrl: widget.onboardingStepsCubit.state.currentIndex != 0
            ? SvgAssets.backAsset
            : null,
        onFirstButtonPress: () => widget.onboardingStepsCubit.maybePop(),
        title: AppLocalizations.of(context)!.rateSymptom,
      ),
      body: Expanded(
        child: ListView(
          children: [
            const SizedBox(height: 80),
            SvgPicture.asset(
              SvgAssets.rateAsset,
              height: MediaQuery.of(context).size.height * 0.28,
            ),
            const SizedBox(height: 48),
            Text(
              widget.onboardingStepsCubit.state.primarySymptom?.name ?? "",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.yourProgressContent,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                height: 70,
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) => SeverityCard(
                    severity: index + 1,
                    onPress: (severity) => setState(() {
                      selectedSeverity = severity;
                    }),
                    selected: index + 1 == selectedSeverity,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: OriaRoundedButton(
        onPress: () async {
          if (selectedSeverity != null) {
            BlocProvider.of<ProgramsBloc>(context).add(
              FetchSymptomPrograms(
                symptomId:
                    widget.onboardingStepsCubit.state.primarySymptom!.symptomId,
              ),
            );
            final result = await widget.onboardingStepsCubit
                .updateData(severity: selectedSeverity!);
            if (result) {
              router.replaceAll([const AppOrchestratorRoute()]);
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              OriaErrorSnackBar(
                content: AppLocalizations.of(context)!.mustSelectValue,
              ),
            );
          }
        },
        disabled: selectedSeverity == null,
        text: AppLocalizations.of(context)!.next,
      ),
    );
  }
}
