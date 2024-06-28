import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_rounded_password_input.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../widgets/oria_rounded_button.dart';
import '../bloc/user_bloc.dart';

@RoutePage()
class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  String password = "";
  String confirmation = "";
  @override
  Widget build(BuildContext context) {
    return OriaScaffold(
      appBarData: AppBarData(
        firstButtonUrl: SvgAssets.backAsset,
        onFirstButtonPress: () => context.maybePop(),
        title: AppLocalizations.of(context)!.editPassword,
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UpdatePasswordSuccess) {
            context.maybePop();
          }
        },
        builder: (context, state) {
          return Expanded(
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
                      BlocProvider.of<UserBloc>(context).add(
                        UpdatePassword(
                          password: password,
                        ),
                      );
                    }
                  },
                  text: AppLocalizations.of(context)!.saveChanges,
                  disabled: password.isEmpty ||
                      password.length < 6 ||
                      password != confirmation,
                  isLoading: state is UpdatePasswordLoading,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
