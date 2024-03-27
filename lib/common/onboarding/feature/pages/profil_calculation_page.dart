import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';

import '../../../../utils/constants/svg_assets.dart';
import '../../../../widgets/oria_scaffold.dart';
import '../cubit/onboarding_steps_cubit.dart';

@RoutePage()
class ProfilCalculationPage extends StatelessWidget {
  const ProfilCalculationPage(
      {super.key, required this.progress, required this.onboardingStepsCubit});

  final double progress;
  final OnboardingStepsCubit onboardingStepsCubit;

  @override
  Widget build(BuildContext context) {
    return OriaScaffold(
      crossAxisAlignment: CrossAxisAlignment.center,
      body: Expanded(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 58),
              SvgPicture.asset(
                SvgAssets.profilCalculationAsset,
              ),
              const SizedBox(height: 58),
              Text(
                AppLocalizations.of(context)!.developedByOria,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              LinearProgressIndicator(
                value: progress / 100,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  OriaColors.primaryColor,
                ),
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 20),
              Text(
                "$progress%",
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
