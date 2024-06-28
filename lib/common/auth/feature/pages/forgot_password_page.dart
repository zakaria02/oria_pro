import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/utils/router/router.dart';

import '../../../../utils/constants/oria_colors.dart';
import '../../../../utils/constants/svg_assets.dart';
import '../../../../widgets/oria_app_bar.dart';
import '../../../../widgets/oria_card.dart';
import '../../../../widgets/oria_rounded_button.dart';
import '../../../../widgets/oria_rounded_input.dart';
import '../../../../widgets/oria_scaffold.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String _email = "";
  @override
  Widget build(BuildContext context) {
    return OriaScaffold(
      appBarData: AppBarData(
        lastButtonUrl: SvgAssets.closeAsset,
        onLastButtonPress: () => context.router.maybePop(),
      ),
      body: Expanded(
        child: ListView(
          children: [
            OriaCard(
              backgroundColor: null,
              borderColor: OriaColors.dividerColor,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SvgPicture.asset(SvgAssets.logoBackgroundAsset),
                  SvgPicture.asset(SvgAssets.forgotPasswordAsset),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            OriaCard(
              borderColor: OriaColors.dividerColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.forgotYourPassword,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    AppLocalizations.of(context)!
                        .forgotYourPasswordExplinaition,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      AppLocalizations.of(context)!.email,
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  OriaRoundedInput(
                    hintText: "examplemail@mail.com",
                    isEmail: true,
                    controlelrValue: _email,
                    onTextChange: (email) {
                      setState(() {
                        _email = email;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            OriaRoundedButton(
              onPress: () {
                if (_email.isNotEmpty && EmailValidator.validate(_email)) {
                  context.pushRoute(ForgotPasswordEmailRoute(email: _email));
                }
              },
              text: AppLocalizations.of(context)!.sendEmail,
              disabled: _email.isEmpty || !EmailValidator.validate(_email),
            ),
          ],
        ),
      ),
    );
  }
}
