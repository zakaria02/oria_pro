import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_rounded_password_input.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../widgets/oria_rounded_button.dart';

@RoutePage()
class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  String password = "";
  String confirmation = "";
  @override
  Widget build(BuildContext context) {
    return OriaScaffold(
        appBarData: AppBarData(
          firstButtonUrl: SvgAssets.backAsset,
          onFirstButtonPress: () => context.maybePop(),
          title: AppLocalizations.of(context)!.password,
        ),
        body: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.newPassword,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 12),
              OriaRoundedPassword(
                onTextChanged: (tippedPassword) {
                  setState(() {
                    password = tippedPassword;
                  });
                },
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.passwordConfirmation,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 12),
              OriaRoundedPassword(
                onTextChanged: (tippedConfirmation) {
                  setState(() {
                    confirmation = tippedConfirmation;
                  });
                },
              ),
              const SizedBox(height: 24),
              OriaRoundedButton(
                onPress: () {
                  if (password.isNotEmpty &&
                      password.length >= 6 &&
                      password == confirmation) {}
                },
                text: AppLocalizations.of(context)!.saveChanges,
                disabled: password.isEmpty ||
                    password.length < 6 ||
                    password != confirmation,
              ),
            ],
          ),
        ));
  }
}
