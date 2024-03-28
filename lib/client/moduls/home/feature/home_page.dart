import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/home/feature/widget/home_symptom_card.dart';
import 'package:oria_pro/client/moduls/home/feature/widget/more_insight.dart';
import 'package:oria_pro/utils/constants/png_assets.dart';
import 'package:oria_pro/widgets/oria_icon_button.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_rounded_image.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:oria_pro/widgets/oria_snack_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../utils/constants/svg_assets.dart';
import 'bloc/home_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  String greeting(BuildContext context, String name) {
    DateTime currentTime = DateTime.now();
    if (currentTime.hour >= 4 && currentTime.hour < 12) {
      return AppLocalizations.of(context)!.goodMorning(name);
    } else if (currentTime.hour >= 12 && currentTime.hour < 18) {
      return AppLocalizations.of(context)!.goodAfternoon(name);
    } else {
      return AppLocalizations.of(context)!.goodEvening(name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetHomeData()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              OriaErrorSnackBar(content: state.errorMessage),
            );
          }
        },
        builder: (blocContext, state) {
          return OriaScaffold(
            bottomBarPadding: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            body: Builder(
              builder: (context) {
                if (state is GetHomeDataLoading) {
                  return const OriaLoadingProgress();
                }
                return Column(
                  children: [
                    if (state.currentUser != null)
                      Row(
                        children: [
                          OriaRoundedImage(
                            networkImage: state.currentUser?.profilePicture,
                            assetImage:
                                state.currentUser?.profilePicture == null
                                    ? PngAssets.womanAsset
                                    : null,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            greeting(context, state.currentUser!.name),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const Spacer(),
                          const OriaIconButton(
                            url: SvgAssets.activeNotificationIcon,
                          )
                        ],
                      ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: [
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
                                    borderRadius: BorderRadius.circular(200)),
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
                        SizedBox(
                          height: 125,
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
                                        BlocProvider.of<HomeBloc>(context).add(
                                      SelectSymptom(
                                        symptom: state.userSymptoms[index],
                                      ),
                                    ),
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 10),
                                  itemCount: state.userSymptoms.length,
                                ),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
