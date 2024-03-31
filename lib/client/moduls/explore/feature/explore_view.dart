import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/expert_top_select.dart';
import 'package:oria_pro/client/moduls/explore/feature/cubit/explore_navigation_cubit.dart';
import 'package:oria_pro/client/moduls/explore/feature/learning/learning_view.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/programs_view.dart';
import 'package:oria_pro/widgets/oria_top_select.dart';

import 'entity/explore_top_select.dart';
import 'learning/bloc/article_categories_bloc.dart';
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
                items: state.topSelectItems
                    .map((e) => ExpertTopSelectItem(title: e, count: null))
                    .toList(),
                selectedItem: state.currentItem,
                onItemPress: (item) =>
                    BlocProvider.of<ExploreNavigationCubit>(context)
                        .selectItem(item.title),
              ),
              const SizedBox(height: 20),
              Builder(
                builder: (context) {
                  if (state.currentItem == ExploreTopSelect.programs(context)) {
                    return const ProgramsView();
                  }
                  if (state.currentItem == ExploreTopSelect.learning(context)) {
                    return const LearningView();
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
