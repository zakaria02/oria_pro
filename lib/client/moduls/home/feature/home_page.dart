import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/client/moduls/home/feature/widget/home_symptom_card.dart';
import 'package:oria_pro/client/moduls/home/feature/widget/more_insight.dart';
import 'package:oria_pro/common/symptoms/feature/entity/symptom.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/png_assets.dart';
import 'package:oria_pro/utils/router/router.dart';
import 'package:oria_pro/widgets/oria_icon_button.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_rounded_image.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:oria_pro/widgets/oria_snack_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../utils/constants/svg_assets.dart';
import '../../../cubit/client_navigation_cubit.dart';
import 'bloc/home_bloc.dart';
import 'bloc/notification_bloc.dart';
import 'widget/daily_actions.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  String greeting(BuildContext context, String name) {
    DateTime currentTime = DateTime.now();
    final firstName = name.split(" ").first;
    if (currentTime.hour >= 4 && currentTime.hour < 12) {
      return AppLocalizations.of(context)!.goodMorning(firstName);
    } else if (currentTime.hour >= 12 && currentTime.hour < 18) {
      return AppLocalizations.of(context)!.goodAfternoon(firstName);
    } else {
      return AppLocalizations.of(context)!.goodEvening(firstName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()
        ..add(FetchUserInfo())
        ..add(FetchUserCurrentSymptoms())
        ..add(FetchTodaysActions()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              OriaErrorSnackBar(
                  content: AppLocalizations.of(context)!.error_default),
            );
          }
        },
        builder: (blocContext, state) {
          return OriaScaffold(
            bottomBarPadding: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            body: Builder(
              builder: (context) {
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state.currentUser != null)
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  BlocProvider.of<ClientNavigationCubit>(
                                context,
                              ).changeBottomBarIndex(5),
                              child: OriaRoundedImage(
                                networkImage: state.currentUser?.profilePicture,
                                assetImage:
                                    state.currentUser?.profilePicture == null
                                        ? PngAssets.womanAsset
                                        : null,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              greeting(context, state.currentUser!.name),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const Spacer(),
                            BlocProvider(
                              create: (context) => NotificationBloc()
                                ..add(FetchAllNotifications()),
                              child: BlocBuilder<NotificationBloc,
                                  NotificationState>(
                                builder:
                                    (notificationsContext, notificationsState) {
                                  return OriaIconButton(
                                    url: notificationsState.notifications
                                            .any((notif) => !notif.read)
                                        ? SvgAssets.activeNotificationIcon
                                        : SvgAssets.notificationIcon,
                                    onPress: () => context
                                        .pushRoute(const NotificationsRoute()),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      const SizedBox(
                        height: 8,
                      ),
                      if (state is FetchUserInfoLoading ||
                          state is FetchTodaysActionsLoading ||
                          state is FetchUserCurrentSymptomsLoading ||
                          state is AddSeverityLoading)
                        const OriaLoadingProgress(),
                      const SizedBox(
                        height: 8,
                      ),
                      if (state.userSymptoms.isNotEmpty) ...[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(70),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                SvgAssets.editPrimaryIcon,
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .primarySymptom,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    state.userSymptoms
                                        .firstWhere((symp) =>
                                            symp.type == SymptomType.primary)
                                        .name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () => context.pushRoute(
                                  EditMySymptomsRoute(
                                    refresh: () =>
                                        BlocProvider.of<HomeBloc>(context).add(
                                      FetchUserCurrentSymptoms(),
                                    ),
                                    refreshTodaysAction: () =>
                                        BlocProvider.of<HomeBloc>(context).add(
                                      FetchTodaysActions(),
                                    ),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: OriaColors.primaryColor,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Text(
                                    AppLocalizations.of(context)!.change,
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            if (state.actions != null)
                              DailyActionsSteps(
                                symptoms: state.userSymptoms,
                                name: state.currentUser!.name,
                                actions: state.actions!,
                                primarySymptom: state.userSymptoms
                                    .firstWhere((sym) =>
                                        sym.type == SymptomType.primary)
                                    .name,
                                onStartHerePress: (completedProgramSection,
                                    readArticle, loggedSymptomSeverity) {
                                  BlocProvider.of<HomeBloc>(context).add(
                                    FinishAnAction(
                                      completedProgramSection:
                                          completedProgramSection,
                                      readArticle: readArticle,
                                      loggedSymptomSeverity:
                                          loggedSymptomSeverity,
                                    ),
                                  );
                                },
                                finishSection: (sectionId, programId) {
                                  BlocProvider.of<HomeBloc>(context).add(
                                    FinishASection(
                                      sectionId: sectionId,
                                      programId: programId,
                                    ),
                                  );
                                },
                                refreshTodaysAction: () {
                                  BlocProvider.of<HomeBloc>(context)
                                      .add(FetchTodaysActions());
                                },
                              ),
                            if (state.userSymptoms.isNotEmpty) ...[
                              Row(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.keepLearning,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontFamily: "Marcellus",
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  const Spacer(),
                                  if (state.selectedSymptom != null)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 4),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(200)),
                                      child: Text(
                                        state.selectedSymptom!.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(fontSize: 10),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                            ],
                            SizedBox(
                              height: 142,
                              child: state.selectedSymptom != null
                                  ? const MoreInsight()
                                  : ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          HomeSymptomCard(
                                        symptom: state.userSymptoms[index],
                                        onPress: () =>
                                            BlocProvider.of<HomeBloc>(context)
                                                .add(
                                          SelectSymptom(
                                            symptom: state.userSymptoms[index],
                                          ),
                                        ),
                                      ),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(width: 10),
                                      itemCount: state.userSymptoms.length,
                                    ),
                            ),
                            const SizedBox(
                              height: 16,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
