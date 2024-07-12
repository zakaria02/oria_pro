import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/client/moduls/account/feature/bloc/user_bloc.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/router/router.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';
import 'package:oria_pro/widgets/oria_snack_bar.dart';
import 'package:pinput/pinput.dart';

import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';

import '../../../../../common/auth/business/email_password/locator/email_password_locator.dart';
import '../../../../../common/auth/business/local_data_source/auth_local_data_source.dart';

@RoutePage()
class DeleteAccountEmailPage extends StatefulWidget {
  const DeleteAccountEmailPage({super.key});

  @override
  State<DeleteAccountEmailPage> createState() => _DeleteAccountEmailPageState();
}

class _DeleteAccountEmailPageState extends State<DeleteAccountEmailPage> {
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
      create: (_) => UserBloc()..add(DeleteAccount()),
      child: BlocConsumer<UserBloc, UserState>(
        listener: (authContext, state) async {
          if (state is UserError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(OriaErrorSnackBar(content: state.errorMessage));
          }
          if (state is DeleteAccount2FASuccess) {
            final dataSource =
                EmailPasswordAuthLocator().get<AuthLocalDataSource>();
            await dataSource.deleteUser();
            // ignore: use_build_context_synchronously
            context.router.replaceAll([const AppOrchestratorRoute()]);
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
                if (state is DeleteAccountLoading) const OriaLoadingProgress(),
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
                                BlocProvider.of<UserBloc>(authContext)
                                    .add(DeleteAccount()),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                OriaRoundedButton(
                  onPress: () {
                    if (token.length == 6) {
                      BlocProvider.of<UserBloc>(authContext)
                          .add(DeleteAccount2FA(token: token));
                    }
                  },
                  text: AppLocalizations.of(context)!.continue_key,
                  disabled: token.length != 6,
                  isLoading: state is DeleteAccount2FALoading,
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}
