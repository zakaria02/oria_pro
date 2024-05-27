import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../utils/router/router.dart';
import '../../../../widgets/oria_snack_bar.dart';
import '../bloc/auth_bloc.dart';
import 'auth_base_view.dart';

@RoutePage()
class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              OriaErrorSnackBar(
                content: state.errorMessage,
              ),
            );
          } else if (state is AuthSuccess) {
            context.router.replaceAll([const AppOrchestratorRoute()]);
          }
        },
        builder: (context, state) {
          return AuthBaseView(
            title: AppLocalizations.of(context)!.letsCreateAccount,
            linkText: AppLocalizations.of(context)!.alreadyHaveAccount,
            linkClickableText: AppLocalizations.of(context)!.login,
            onPress: (email, password) => BlocProvider.of<AuthBloc>(context)
                .add(SignUp(email: email, password: password)),
            onGooglePress: () =>
                BlocProvider.of<AuthBloc>(context).add(GoogleLogin()),
            onApplePress: () {},
            onFacebookPress: () {},
            onLinkPress: () => context.router.maybePop(),
            buttonText: AppLocalizations.of(context)!.signUp,
            loading: state is AuthLoading,
            userLoading: state is GetUserLoading,
          );
        },
      ),
    );
  }
}
