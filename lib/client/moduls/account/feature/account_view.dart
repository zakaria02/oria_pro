import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/account/feature/widgets/account_param.dart';
import 'package:oria_pro/client/moduls/account/feature/widgets/user_image.dart';
import 'package:oria_pro/common/auth/business/email_password/locator/email_password_locator.dart';
import 'package:oria_pro/common/auth/business/local_data_source/auth_local_data_source.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/utils/router/router.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bloc/user_bloc.dart';
import 'pages/update_my_info_page.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(FetchAccount()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (userBlocContext, userState) {
          return ListView(
            children: [
              OriaCard(
                onlyTopRaduis: true,
                child: Column(
                  children: [
                    UserImage(
                      userImage: userState.currenUser?.profilePicture,
                      size: 88,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      userState.currenUser?.name ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontFamily: "Raleway"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 1),
              AccountParam(
                image: SvgAssets.myInfoIcon,
                onlyBottomRaduis: true,
                title: AppLocalizations.of(context)!.myInfo,
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                ),
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BlocProvider.value(
                            value: BlocProvider.of<UserBloc>(
                              userBlocContext,
                            ),
                            child: const UpdateMyInfoPage());
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              AccountParam(
                image: SvgAssets.medicalInfoIcon,
                title: AppLocalizations.of(context)!.medicalInfo,
                onPress: () => context.router.push(const MedicalInfoRoute()),
              ),
              const SizedBox(height: 8),
              AccountParam(
                onlyTopRaduis: true,
                image: SvgAssets.policyIcon,
                title: AppLocalizations.of(context)!.privacyPolicy,
                onPress: () async {
                  await launchUrl(Uri.parse('https://www.google.com'));
                },
              ),
              const SizedBox(height: 1),
              AccountParam(
                noRaduis: true,
                image: SvgAssets.termsIcon,
                title: AppLocalizations.of(context)!.generalConditions,
                onPress: () async {
                  await launchUrl(Uri.parse('https://www.google.com'));
                },
              ),
              const SizedBox(height: 1),
              AccountParam(
                onlyBottomRaduis: true,
                image: SvgAssets.logoutIcon,
                title: AppLocalizations.of(context)!.logout,
                onPress: () async {
                  final dataSource =
                      EmailPasswordAuthLocator().get<AuthLocalDataSource>();
                  await dataSource.deleteUser();
                  // ignore: use_build_context_synchronously
                  context.router.replaceAll([const AppOrchestratorRoute()]);
                },
              ),
              const SizedBox(height: 1),
            ],
          );
        },
      ),
    );
  }
}
