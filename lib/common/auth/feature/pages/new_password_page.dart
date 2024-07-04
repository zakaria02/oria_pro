import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_rounded_password_input.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../widgets/oria_rounded_button.dart';
import '../../../../widgets/oria_snack_bar.dart';
import '../bloc/auth_bloc.dart';

@RoutePage()
class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({
    super.key,
    required this.token,
  });
  final String token;

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  String password = "";
  String confirmation = "";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (authContext, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(OriaErrorSnackBar(content: state.errorMessage));
        } else if (state is ResetPasswordSuccess) {
          context.router.popUntil((route) => route.isFirst);
          ScaffoldMessenger.of(context).showSnackBar(OriaSuccessSnackBar(
              content: AppLocalizations.of(context)!.pwd_reseted));
        }
      },
      builder: (authContext, state) {
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
                          password == confirmation) {
                        BlocProvider.of<AuthBloc>(authContext).add(
                            ResetPassword(
                                token: widget.token, password: password));
                      }
                    },
                    text: AppLocalizations.of(context)!.saveChanges,
                    disabled: password.isEmpty ||
                        password.length < 6 ||
                        password != confirmation,
                    isLoading: state is ResetPasswordLoading,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
