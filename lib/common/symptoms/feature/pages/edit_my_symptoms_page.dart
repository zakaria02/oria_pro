import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/common/symptoms/feature/entity/symptom.dart';
import 'package:oria_pro/common/symptoms/feature/pages/update_primary_symptom_page.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../widgets/oria_card.dart';
import '../bloc/symptom_bloc.dart';
import '../widgets/symptom_card.dart';
import 'update_secondary_symptoms_page.dart';

@RoutePage()
class EditMySymptomsPage extends StatelessWidget {
  const EditMySymptomsPage({
    super.key,
    required this.refresh,
    required this.refreshTodaysAction,
  });
  final VoidCallback refresh;
  final VoidCallback refreshTodaysAction;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SymptomBloc()..add(FetchUserSymptoms()),
      child: BlocBuilder<SymptomBloc, SymptomState>(
        builder: (blocContext, state) {
          final primarySymptom = state.userSymptoms
              .where((sym) => sym.type == SymptomType.primary)
              .firstOrNull;
          final secondarySymptoms = state.userSymptoms
              .where((sym) => sym.type == SymptomType.secondary)
              .toList();
          return OriaScaffold(
            appBarData: AppBarData(
              firstButtonUrl: SvgAssets.backAsset,
              onFirstButtonPress: () => context.maybePop(),
              title: AppLocalizations.of(context)!.editMySymptoms,
            ),
            body: Expanded(
              child: ListView(
                children: [
                  if (state is UserSymptomsLoading ||
                      state is DeleteSecondaryLoading)
                    const OriaLoadingProgress(),
                  const SizedBox(height: 24),
                  Text(
                    AppLocalizations.of(context)!.myPrimarySymptom,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 20),
                  if (primarySymptom != null)
                    OriaCard(
                      backgroundColor: OriaColors.green,
                      child: Row(
                        children: [
                          Image.network(
                            primarySymptom.icon,
                            height: 32,
                            color: OriaColors.iconButtonBackgound,
                          ),
                          const SizedBox(width: 20),
                          Text(
                            primarySymptom.name,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  color: OriaColors.iconButtonBackgound,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<SymptomBloc>(blocContext)
                                  .add(FetchAllSymptoms());
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return BlocProvider.value(
                                      value: BlocProvider.of<SymptomBloc>(
                                        blocContext,
                                      ),
                                      child: UpdatePrimarySymptomPage(
                                        currentSymptom: primarySymptom,
                                        refresh: refresh,
                                        refreshTodaysAction:
                                            refreshTodaysAction,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 6),
                              child: Text(
                                AppLocalizations.of(context)!.change,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: OriaColors.green,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 26),
                  Text(
                    AppLocalizations.of(context)!.otherSymptoms,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) => SymptomCard(
                        symptom: secondarySymptoms[index].toSymptom(),
                        selected: false,
                        onPress: () => BlocProvider.of<SymptomBloc>(context)
                            .add(SelectPrimarySymptom(
                                symptom: secondarySymptoms[index].toSymptom())),
                        onDelete: () => BlocProvider.of<SymptomBloc>(context)
                            .add(DeleteSecondarySymptom(
                                symptom: secondarySymptoms[index].toSymptom())),
                      ),
                      itemCount: secondarySymptoms.length,
                    ),
                  ),
                  const SizedBox(height: 36),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: OriaRoundedButton(
                      onPress: () {
                        if (secondarySymptoms.length < 3) {
                          BlocProvider.of<SymptomBloc>(blocContext)
                              .add(FetchAllSymptoms());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return BlocProvider.value(
                                  value: BlocProvider.of<SymptomBloc>(
                                    blocContext,
                                  ),
                                  child: UpdateSecondarySymptomsPage(
                                    currentSymptoms: secondarySymptoms,
                                    primarySymptom: primarySymptom,
                                    refresh: refresh,
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                      disabled: secondarySymptoms.length >= 3,
                      text: AppLocalizations.of(context)!.addMoreSymptoms,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
