import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/tracker/feature/enitity/tracked_symptom.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../common/symptoms/feature/widgets/symptom_card.dart';
import '../bloc/tracker_bloc.dart';

class CompareWithSymptom extends StatelessWidget {
  const CompareWithSymptom({
    super.key,
    required this.currentSymptom,
  });
  final TrackedSymptom currentSymptom;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackerBloc, TrackerState>(
      builder: (context, state) {
        final symptoms = state.symptoms
            .where((symptom) => symptom.id != currentSymptom.id)
            .toList();
        return OriaScaffold(
          appBarData: AppBarData(
            firstButtonUrl: SvgAssets.backAsset,
            onFirstButtonPress: () => context.maybePop(),
            title: AppLocalizations.of(context)!.chooseSymptom,
          ),
          body: Expanded(
            child: SizedBox(
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) => SymptomCard(
                  symptom: symptoms[index].toSymptom(),
                  selected: false,
                  onPress: () => Navigator.maybePop(
                    context,
                    symptoms[index],
                  ),
                ),
                itemCount: symptoms.length,
              ),
            ),
          ),
        );
      },
    );
  }
}
