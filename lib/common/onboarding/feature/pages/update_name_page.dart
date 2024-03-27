import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/utils/router/router.dart';

import '../../../../utils/constants/svg_assets.dart';
import '../../../../widgets/oria_app_bar.dart';
import '../../../../widgets/oria_card.dart';
import '../../../../widgets/oria_custom_rounded_input.dart';
import '../../../../widgets/oria_rounded_button.dart';
import '../../../../widgets/oria_scaffold.dart';
import '../../../../widgets/oria_snack_bar.dart';
import '../cubit/onboarding_steps_cubit.dart';

class UpdateNamePage extends StatefulWidget {
  const UpdateNamePage({super.key, required this.onboardingStepsCubit});

  final OnboardingStepsCubit onboardingStepsCubit;

  @override
  State<StatefulWidget> createState() => _UpdateNamePageState();
}

class _UpdateNamePageState extends State<UpdateNamePage> {
  String? selectedName;

  @override
  Widget build(BuildContext context) {
    final router = context.router;
    return OriaScaffold(
      appBarData: AppBarData(
        firstButtonUrl: widget.onboardingStepsCubit.state.currentIndex != 0
            ? SvgAssets.backAsset
            : null,
        onFirstButtonPress: () => widget.onboardingStepsCubit.maybePop(),
      ),
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height:
                  widget.onboardingStepsCubit.state.currentIndex != 0 ? 0 : 30,
            ),
            OriaCard(
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.yourName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    AppLocalizations.of(context)!.thisInfoWillHelpUs,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  OriaCustomRoundedTextInput(
                    hintText: AppLocalizations.of(context)!.name,
                    currentValue: selectedName,
                    onTextChange: (name) {
                      setState(() {
                        selectedName = name;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
      bottomNavigationBar: OriaRoundedButton(
        onPress: () async {
          FocusScope.of(context).unfocus();
          if (selectedName != null && selectedName!.isNotEmpty) {
            final result = await widget.onboardingStepsCubit
                .updateData(name: selectedName!);
            if (result) {
              router.replaceAll([const AppOrchestratorRoute()]);
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(OriaErrorSnackBar(
              content: AppLocalizations.of(context)!.mustSelectAName,
            ));
          }
        },
        text: AppLocalizations.of(context)!.next,
      ),
    );
  }
}
