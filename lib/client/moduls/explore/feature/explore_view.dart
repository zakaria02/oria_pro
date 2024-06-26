import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/explore/feature/cubit/explore_navigation_cubit.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/programs_view.dart';
import 'package:oria_pro/widgets/oria_top_select.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'entity/explore_top_select.dart';
import 'learning/bloc/article_categories_bloc.dart';
import 'learning/learning_view.dart';
import 'programs/bloc/programs_bloc.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                ExploreNavigationCubit(ExploreTopSelect.items(context))),
        BlocProvider(
            create: (_) => ProgramsBloc()..add(FetchProgramsCategories())),
        BlocProvider(
          create: (_) =>
              ArticleCategoriesBloc()..add(FetchLearningCategories()),
        ),
      ],
      child: BlocBuilder<ExploreNavigationCubit, ExploreNavigationState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 20),
              OriaTopBarSelect(
                items: state.topSelectItems,
                selectedItem: state.currentItem,
                onItemPress: (item) =>
                    BlocProvider.of<ExploreNavigationCubit>(context)
                        .selectItem(item),
              ),
              const SizedBox(height: 20),
              Builder(
                builder: (context) {
                  if (state.currentItem == ExploreTopSelect.programs(context)) {
                    return const ProgramsView();
                  }
                  if (state.currentItem == ExploreTopSelect.learn(context)) {
                    return const LearningView();
                  }
                  if (state.currentItem == ExploreTopSelect.liveQA(context)) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.commingSoon,
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              )
            ],
          );
        },
      ),
    );
  }
}
