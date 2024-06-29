import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/explore_top_select.dart';
import 'package:oria_pro/client/moduls/explore/feature/learning/for_you_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../widgets/oria_top_select.dart';
import '../cubit/learn_navigation_cubit.dart';

class LearningView extends StatelessWidget {
  const LearningView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LearnNavigationCubit(
            ExploreTopSelect.learnItems(context),
          ),
        ),
      ],
      child: BlocBuilder<LearnNavigationCubit, LearnNavigationState>(
        builder: (context, state) {
          return Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: OriaTopBarSelect(
                    items: state.topSelectItems,
                    selectedItem: state.currentItem,
                    onItemPress: (item) =>
                        BlocProvider.of<LearnNavigationCubit>(context)
                            .selectItem(item),
                    padding: EdgeInsets.zero,
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 20),
                Builder(
                  builder: (context) {
                    if (state.currentItem == ExploreTopSelect.forYou(context)) {
                      return const ForYouView();
                    }
                    if (state.currentItem ==
                        ExploreTopSelect.moreArticles(context)) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.commingSoon,
                          ),
                        ),
                      );
                    }
                    return Expanded(
                      child: Center(
                        child: Text(state.currentItem),
                      ),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
