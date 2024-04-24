import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:oria_pro/client/moduls/home/feature/widget/symptom_card.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/symptoms/feature/entity/symptom.dart';

@RoutePage()
class SymptomsListPage extends StatelessWidget {
  const SymptomsListPage({
    super.key,
    required this.symptoms,
  });
  final List<Symptom> symptoms;

  @override
  Widget build(BuildContext context) {
    return OriaScaffold(
      appBarData: AppBarData(
        firstButtonUrl: SvgAssets.backAsset,
        onFirstButtonPress: () => context.maybePop(),
        title: AppLocalizations.of(context)!.chooseSymptom,
      ),
      body: Expanded(
          child: ListView(
        children: [
          const SizedBox(height: 80),
          Text(
            AppLocalizations.of(context)!.wouldLikeFocusSomething,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontFamily: "Marcellus",
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                SymptomCard(symptom: symptoms[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: symptoms.length,
          )
        ],
      )),
    );
  }
}
