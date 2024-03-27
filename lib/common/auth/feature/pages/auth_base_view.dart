import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/constants/oria_colors.dart';
import '../../../../utils/constants/svg_assets.dart';
import '../../../../widgets/oria_card.dart';
import '../../../../widgets/oria_rounded_button.dart';
import '../../../../widgets/oria_rounded_input.dart';
import '../../../../widgets/oria_rounded_password_input.dart';
import '../../../../widgets/oria_scaffold.dart';

/// This is a base view used to build login and create account views

class AuthBaseView extends StatefulWidget {
  const AuthBaseView({
    super.key,
    required this.title,
    required this.onPress,
    required this.onApplePress,
    required this.onFacebookPress,
    this.onForgotPasswordPress,
    required this.onLinkPress,
    required this.linkText,
    required this.linkClickableText,
    required this.buttonText,
    this.loading = false,
    required this.userLoading,
  });

  final String title;
  final Function(String, String) onPress;
  final VoidCallback onApplePress;
  final VoidCallback onFacebookPress;
  final VoidCallback? onForgotPasswordPress;
  final VoidCallback onLinkPress;
  final String linkText;
  final String linkClickableText;
  final String buttonText;
  final bool loading;
  final bool userLoading;

  @override
  State<AuthBaseView> createState() => _AuthBaseViewState();
}

class _AuthBaseViewState extends State<AuthBaseView> {
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return OriaScaffold(
      body: Expanded(
        child: Center(
          child: widget.userLoading
              ? const SizedBox(
                  height: 48,
                  width: 48,
                  child: CircularProgressIndicator(
                    color: OriaColors.primaryColor,
                  ),
                )
              : OriaCard(
                  borderColor: OriaColors.dividerColor,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        SvgPicture.asset(
                          SvgAssets.logoAsset,
                          height: 70,
                          width: 70,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          widget.title,
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 12,
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
                          onTextChange: (email) {
                            _email = email;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            AppLocalizations.of(context)!.password,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        OriaRoundedPassword(
                          onTextChanged: (password) {
                            _password = password;
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        OriaRoundedButton(
                          onPress: widget.loading
                              ? () {}
                              : () => widget.onPress(_email, _password),
                          text: widget.buttonText,
                          isLoading: widget.loading,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: AppLocalizations.of(context)!
                                    .whenYouCreateAccount,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: OriaColors.grey,
                                    ),
                              ),
                              TextSpan(
                                text: AppLocalizations.of(context)!
                                    .generalConditions,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: OriaColors.grey,
                                        decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    await launchUrl(
                                        Uri.parse('https://www.google.com'));
                                  },
                              ),
                              TextSpan(
                                text: AppLocalizations.of(context)!.andThe,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: OriaColors.grey,
                                    ),
                              ),
                              TextSpan(
                                text:
                                    AppLocalizations.of(context)!.privacyPolicy,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: OriaColors.grey,
                                      decoration: TextDecoration.underline,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    await launchUrl(
                                        Uri.parse('https://www.google.com'));
                                  },
                              ),
                              TextSpan(
                                text: AppLocalizations.of(context)!
                                    .traitementOria,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: OriaColors.grey,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: widget.onForgotPasswordPress != null,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: InkWell(
                                  onTap: widget.onForgotPasswordPress,
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .forgotPassword,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        InkWell(
                          onTap: widget.onLinkPress,
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: widget.linkText,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(color: OriaColors.disabledColor),
                              ),
                              TextSpan(
                                text: widget.linkClickableText,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Row(
        children: [
          buildDivider(),
          const SizedBox(
            width: 12,
          ),
          Text(
            AppLocalizations.of(context)!.or,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(
            width: 12,
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded(
      child: Divider(
        height: 1,
      ),
    );
  }
}
