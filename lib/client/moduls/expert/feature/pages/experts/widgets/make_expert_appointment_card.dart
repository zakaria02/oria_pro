import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oria_pro/client/moduls/expert/feature/bloc/expert_bloc.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/utils/router/router.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../../widgets/oria_icon_button.dart';
import '../../../entity/expert.dart';

class MakeExpertAppointmentCard extends StatelessWidget {
  const MakeExpertAppointmentCard({
    super.key,
    required this.expert,
    required this.hasMedicalInfo,
  });

  final Expert expert;
  final bool? hasMedicalInfo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        OriaCard(
          borderColor: OriaColors.iconButtonBackgound,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(
                                expert.profilePicture,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        if ((expert.rateAvarage ?? 0) > 0)
                          Container(
                            width: 55,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              border: Border.all(
                                color: const Color(0xFFFEBD3F),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 3,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  SvgAssets.starIcon,
                                  height: 14,
                                  width: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  expert.rateAvarage?.toStringAsFixed(2) ?? "",
                                  style: const TextStyle(
                                    color: OriaColors.darkGrey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                    fontFamily: "satoshi",
                                  ),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr. ${expert.firstName} ${expert.lastName}",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          expert.specialty,
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: OriaColors.green,
                                  ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${expert.yearsOfExperience} ${AppLocalizations.of(context)!.years}",
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: Colors.grey[800],
                                  ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "\$${expert.consultationPrice} - ${AppLocalizations.of(context)!.minutes(30)}",
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontSize: 13,
                                    color: const Color(0xFF43C34C),
                                    fontFamily: "Satoshi",
                                  ),
                        ),
                        const SizedBox(height: 16),
                        Visibility(
                          visible: hasMedicalInfo == true,
                          child: SizedBox(
                            height: 36,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: expert.available
                                  ? () => context.pushRoute(
                                      MakeAppointmentRoute(expert: expert))
                                  : null,
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: const Color(0xFF43C34C),
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.makeAppointment,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: hasMedicalInfo == false,
                child: const SizedBox(height: 12),
              ),
              Visibility(
                visible: hasMedicalInfo == false,
                child: Container(
                  decoration: BoxDecoration(
                    color: OriaColors.greenLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.only(
                      top: 24, bottom: 12, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.finishMedicalInfo,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Colors.black,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () async {
                          final updated = await context.router
                              .push(const MedicalInfoRoute());
                          if (updated == true) {
                            // ignore: use_build_context_synchronously
                            BlocProvider.of<ExpertBloc>(context)
                                .add(FetchMedicalInfo());
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: OriaColors.green,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.addMedicalInfo,
                            style: const TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 10),
          child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: OriaColors.scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 0.5),
                child: OriaIconButton(
                  backgroundColor: Colors.white,
                  url: expert.isFavourite
                      ? SvgAssets.favoriteAsset
                      : SvgAssets.notFavoriteAsset,
                  size: 20,
                  onPress: () {
                    BlocProvider.of<ExpertBloc>(context)
                        .add(UpdateFavorite(expert: expert));
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
