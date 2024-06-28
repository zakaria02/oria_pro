import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/bloc/programs_bloc.dart';
import 'package:oria_pro/common/symptoms/feature/widgets/severity_card.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../utils/constants/oria_colors.dart';
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
  Color get color => switch (selectedSeverity) {
        0 => const Color(0xFFA8E4C2),
        1 => const Color(0xFFFEF3E0),
        2 => const Color(0xFFFFDAA5),
        3 => const Color(0xFFFF8888),
        4 => const Color(0xFFFF5858),
        _ => OriaColors.disabledColor,
      };

  Color get textColor => switch (selectedSeverity) {
        0 => const Color(0xFF1C7D45),
        1 => const Color(0xFF8B6525),
        2 => const Color(0xFF835B22),
        3 => const Color(0xFF6D1212),
        4 => const Color(0xFF8E1212),
        _ => OriaColors.disabledColor,
      };
  @override
  Widget build(BuildContext context) {
    final router = context.router;
    return OriaScaffold(
      appBarData: AppBarData(
        firstButtonUrl: widget.onboardingStepsCubit.state.currentIndex != 0
            ? SvgAssets.backAsset
            : null,
        onFirstButtonPress: () {
          widget.onboardingStepsCubit.maybePop();
          selectedSeverity = null;
        },
        title: AppLocalizations.of(context)!.rateSymptom,
      ),
      body: Expanded(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            SvgPicture.asset(
              SvgAssets.rateAsset,
              height: MediaQuery.of(context).size.height * 0.28,
            ),
            const SizedBox(height: 28),
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
            const SizedBox(
              height: 30,
            ),
            if (selectedSeverity != null)
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 5),
                  child: Text(
                    switch (selectedSeverity) {
                      0 => AppLocalizations.of(context)!.great,
                      1 => AppLocalizations.of(context)!.good,
                      2 => AppLocalizations.of(context)!.okay,
                      3 => AppLocalizations.of(context)!.bad,
                      4 => AppLocalizations.of(context)!.awful,
                      _ => "",
                    },
                    style: TextStyle(
                      color: textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Raleway",
                    ),
                  ),
                ),
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
                    severity: index,
                    onPress: (severity) => setState(() {
                      selectedSeverity = severity;
                      log("severity: $selectedSeverity");
                    }),
                    selected: index == selectedSeverity,
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
