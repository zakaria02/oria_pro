import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/common/auth/feature/pages/new_password_page.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';
import 'package:oria_pro/widgets/oria_snack_bar.dart';
import 'package:pinput/pinput.dart';

import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';

import '../bloc/auth_bloc.dart';

@RoutePage()
class ForgotPasswordEmailPage extends StatefulWidget {
  const ForgotPasswordEmailPage({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<ForgotPasswordEmailPage> createState() =>
      _ForgotPasswordEmailPageState();
}

class _ForgotPasswordEmailPageState extends State<ForgotPasswordEmailPage> {
  String token = "";
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc()..add(ForgotPassword(email: widget.email)),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (authContext, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(OriaErrorSnackBar(content: state.errorMessage));
          }
        },
        builder: (authContext, state) {
          return OriaScaffold(
            appBarData: AppBarData(
              lastButtonUrl: SvgAssets.closeAsset,
              onLastButtonPress: () =>
                  context.router.popUntil((route) => route.isFirst),
            ),
            body: Expanded(
                child: ListView(
              children: [
                const SizedBox(height: 10),
                if (state is ForgotPassworLoading) const OriaLoadingProgress(),
                const SizedBox(height: 10),
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
                Pinput(
                  length: 6,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  defaultPinTheme: defaultPinTheme,
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
                                BlocProvider.of<AuthBloc>(authContext)
                                    .add(ForgotPassword(email: widget.email)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                OriaRoundedButton(
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BlocProvider.value(
                              value: BlocProvider.of<AuthBloc>(
                                authContext,
                              ),
                              child: NewPasswordPage(token: token));
                        },
                      ),
                    );
                  },
                  text: AppLocalizations.of(context)!.continue_key,
                  disabled: token.length != 6,
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}
