import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/common/auth/business/email_password/locator/email_password_locator.dart';
import 'package:oria_pro/common/auth/business/local_data_source/auth_local_data_source.dart';
import 'package:oria_pro/common/email_verification/feature/bloc/email_verification_bloc.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/router/router.dart';
import 'package:oria_pro/widgets/oria_dialog.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';
import 'package:oria_pro/widgets/oria_snack_bar.dart';
import 'package:pinput/pinput.dart';

import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';

@RoutePage()
class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  final defaultPinTheme = PinTheme(
    width: 54,
    height: 54,
    textStyle: const TextStyle(
      fontSize: 24,
      color: OriaColors.green,
      fontWeight: FontWeight.w500,
      fontFamily: "Raleway",
    ),
    decoration: BoxDecoration(
      border: Border.all(color: OriaColors.green),
      borderRadius: BorderRadius.circular(6),
    ),
  );

  final errorPinTheme = PinTheme(
    width: 54,
    height: 54,
    textStyle: const TextStyle(
      fontSize: 24,
      color: Color(0xFFB8A093),
      fontWeight: FontWeight.w500,
      fontFamily: "Raleway",
    ),
    decoration: BoxDecoration(
      border: Border.all(color: OriaColors.red),
      borderRadius: BorderRadius.circular(6),
    ),
  );

  AuthLocalDataSource authLocalDs = EmailPasswordAuthLocator().get();

  Future<void> _showSuccessDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OriaDialog(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(SvgAssets.checkIcon),
              const SizedBox(height: 24),
              Text(
                AppLocalizations.of(context)!.emailVerified,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontFamily: "Raleway",
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              OriaRoundedButton(
                onPress: () =>
                    context.router.replaceAll([const AppOrchestratorRoute()]),
                padding: EdgeInsets.zero,
                text: AppLocalizations.of(context)!.continue_key,
              )
            ],
          ),
        );
      },
    );
  }

  String token = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EmailVerificationBloc()..add(SendVerificationEmail()),
      child: BlocConsumer<EmailVerificationBloc, EmailVerificationState>(
        listener: (context, state) {
          if (state is EmailVerificationError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(OriaErrorSnackBar(content: state.errorMessage));
          }
          if (state is VerifyEmailSuccess) {
            _showSuccessDialog();
          }
        },
        builder: (context, state) {
          return OriaScaffold(
            body: Expanded(
                child: ListView(
              children: [
                const SizedBox(height: 144),
                SvgPicture.asset(SvgAssets.verifyEmailAsset),
                const SizedBox(height: 66),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    AppLocalizations.of(context)!.verifyEmailContent,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    widget.email,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: OriaColors.darkGrey,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 45),
                Visibility(
                  visible: state is VerifyEmailFailed,
                  child: Text(
                    AppLocalizations.of(context)!.pinError,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: OriaColors.redAccent,
                          fontWeight: FontWeight.w400,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 18),
                Pinput(
                  length: 6,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  defaultPinTheme: state is VerifyEmailFailed
                      ? errorPinTheme
                      : defaultPinTheme,
                  onChanged: (value) {
                    setState(() {
                      token = value;
                    });
                  },
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!.didntReceiveCode,
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context)!.requestAgain,
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: OriaColors.orange,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor: OriaColors.orange,
                                  ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () =>
                                BlocProvider.of<EmailVerificationBloc>(context)
                                    .add(SendVerificationEmail()),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                OriaRoundedButton(
                  onPress: () => BlocProvider.of<EmailVerificationBloc>(context)
                    ..add(
                      VerifyEmail(token: token),
                    ),
                  text: AppLocalizations.of(context)!.verifyMyEmail,
                  isLoading: state is VerifyEmailLoading,
                  disabled: token.length != 6,
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () async {
                    await authLocalDs.deleteUser().then((value) => context
                        .router
                        .replaceAll([const AppOrchestratorRoute()]));
                  },
                  child: Text(
                    AppLocalizations.of(context)!.logout,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: OriaColors.orange,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          decorationColor: OriaColors.orange,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}
