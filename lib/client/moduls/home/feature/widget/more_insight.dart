import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/client/moduls/home/feature/bloc/home_bloc.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/utils/router/router.dart';

class MoreInsight extends StatelessWidget {
  const MoreInsight({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Row(
          children: [
            GestureDetector(
              onTap: () =>
                  BlocProvider.of<HomeBloc>(context).add(const SelectSymptom()),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 33),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: OriaColors.primaryColor,
                  ),
                ),
                child: SvgPicture.asset(SvgAssets.arrowLeftIcon),
              ),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: () => context
                  .pushRoute(SymptomDataRoute(symptom: state.selectedSymptom!)),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: OriaColors.greenLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!
                          .gainMoreInsight(state.selectedSymptom!.name),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: OriaColors.greenAccent,
                            fontSize: 16,
                          ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.network(
                        state.selectedSymptom!.icon,
                        height: 40,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
