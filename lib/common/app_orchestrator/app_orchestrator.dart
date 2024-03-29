import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/router/router.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';

import 'cubit/steps_cubit.dart';

@RoutePage()
class AppOrchestratorPage extends StatelessWidget {
  const AppOrchestratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StepsCubit()..getSteps(),
      child: BlocConsumer<StepsCubit, StepsState>(
        listener: (context, state) {
          if (state is StepsSuccess) {
            if (state.steps == null) {
              context.router.replaceAll([const LoginRoute()]);
              // TODO: the condition must be 0, this is a workaround for email verification
            } else if (state.steps?.emailToVerify != null &&
                state.steps!.stepsCount > 1) {
              context.router.replaceAll([
                VerifyEmailRoute(
                  email: state.steps!.emailToVerify!,
                  steps: state.steps!,
                )
              ]);
              // TODO: the condition must be 0, this is a workaround for email verification
            } else if (state.steps?.stepsCount == 1) {
              context.router
                  .replaceAll([OnBoardingStepsRoute(steps: state.steps!)]);
            } else {
              context.router.replaceAll([const ClientAppRoute()]);
            }
          }
        },
        builder: (context, state) {
          return const OriaScaffold(
              body: Expanded(
            child: Center(
              child: SizedBox(
                height: 48,
                width: 48,
                child: CircularProgressIndicator(
                  color: OriaColors.primaryColor,
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
