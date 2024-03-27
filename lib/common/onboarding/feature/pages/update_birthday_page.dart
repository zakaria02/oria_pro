import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/utils/extensions/date_extensions.dart';

import '../../../../utils/constants/svg_assets.dart';
import '../../../../utils/router/router.dart';
import '../../../../widgets/oria_app_bar.dart';
import '../../../../widgets/oria_card.dart';
import '../../../../widgets/oria_custom_rounded_input.dart';
import '../../../../widgets/oria_rounded_button.dart';
import '../../../../widgets/oria_scaffold.dart';
import '../../../../widgets/oria_snack_bar.dart';
import '../cubit/onboarding_steps_cubit.dart';

class UpdateBirthdayPage extends StatefulWidget {
  const UpdateBirthdayPage({super.key, required this.onboardingStepsCubit});

  final OnboardingStepsCubit onboardingStepsCubit;

  @override
  State<StatefulWidget> createState() => _UpdateBirthdayPageState();
}

class _UpdateBirthdayPageState extends State<UpdateBirthdayPage> {
  DateTime? selectedDate;

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
                    AppLocalizations.of(context)!.dateOfBirth,
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
                  OriaCustomRoundedDateInput(
                    hintText: AppLocalizations.of(context)!.dateOfBirth,
                    currentValue: selectedDate?.dateToText(context),
                    onDateChange: (date) {
                      setState(() {
                        selectedDate = date;
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
          if (selectedDate != null) {
            DateTime today = DateTime.now();
            DateTime eighteenYearsAgo =
                DateTime(today.year - 18, today.month, today.day);

            if (selectedDate!.isBefore(eighteenYearsAgo) ||
                selectedDate!.isAtSameMomentAs(eighteenYearsAgo)) {
              final result = await widget.onboardingStepsCubit
                  .updateData(birthDay: selectedDate!.toUtc());
              if (result) {
                router.replaceAll([const AppOrchestratorRoute()]);
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(OriaErrorSnackBar(
                content: AppLocalizations.of(context)!.ageVerification,
              ));
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(OriaErrorSnackBar(
              content: AppLocalizations.of(context)!.mustSelectBirthday,
            ));
          }
        },
        text: AppLocalizations.of(context)!.next,
      ),
    );
  }
}
