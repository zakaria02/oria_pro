import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/expert/feature/cubit/expert_filter_cubit.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/specialty.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:oria_pro/widgets/oria_drop_down.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../../utils/constants/oria_colors.dart';

@RoutePage()
class ExpertFilterPage extends StatefulWidget {
  const ExpertFilterPage({
    super.key,
    required this.specilalties,
    required this.selectedSpeciality,
  });

  final List<Specialty> specilalties;
  final Specialty? selectedSpeciality;

  @override
  State<ExpertFilterPage> createState() => _ExpertFilterPageState();
}

class _ExpertFilterPageState extends State<ExpertFilterPage> {
  Specialty? selectedSpeciality;

  @override
  void initState() {
    selectedSpeciality = widget.selectedSpeciality ?? widget.specilalties.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OriaScaffold(
      appBarData: AppBarData(
        firstButtonUrl: SvgAssets.backAsset,
        onFirstButtonPress: () => context.maybePop(),
        title: AppLocalizations.of(context)!.filters,
      ),
      body: BlocBuilder<ExpertFilterCubit, ExpertFilterState>(
        builder: (context, state) {
          return Expanded(
            child: ListView(
              children: [
                OriaCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.specialty,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 12),
                      OriaDropDown<Specialty>(
                          selectedItem: selectedSpeciality,
                          items: widget.specilalties,
                          onValueChange: (specialty) {
                            setState(() {
                              selectedSpeciality = specialty;
                            });
                          })
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: OriaRoundedButton(
              padding: EdgeInsets.zero,
              onPress: () {
                BlocProvider.of<ExpertFilterCubit>(context).resetFilters();
                context.maybePop();
              },
              text: AppLocalizations.of(context)!.reset,
              textColor: OriaColors.green,
              borderColor: OriaColors.green,
              primaryColor: OriaColors.scaffoldBackgroundColor,
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            child: OriaRoundedButton(
              padding: EdgeInsets.zero,
              onPress: () {
                BlocProvider.of<ExpertFilterCubit>(context).addFilter(
                  specialty: selectedSpeciality,
                );
                context.maybePop();
              },
              text: AppLocalizations.of(context)!.apply,
              primaryColor: OriaColors.darkOrange,
            ),
          ),
        ],
      ),
    );
  }
}
