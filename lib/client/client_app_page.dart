import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/account/feature/account_view.dart';
import 'package:oria_pro/client/moduls/expert/feature/expert_view.dart';
import 'package:oria_pro/client/moduls/explore/feature/explore_view.dart';
import 'package:oria_pro/client/moduls/explore/feature/forum/forum_view.dart';
import 'package:oria_pro/client/moduls/home/feature/home_page.dart';
import 'package:oria_pro/client/navigation/bottom_bar_item.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';

import '../widgets/oria_bottom_bar.dart';
import 'cubit/client_navigation_cubit.dart';
import 'moduls/tracker/feature/tracker_view.dart';

@RoutePage()
class ClientAppPage extends StatelessWidget {
  const ClientAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ClientNavigationCubit(
        BottomBarItem.clientItems(context),
      ),
      child: BlocBuilder<ClientNavigationCubit, ClientNavigationState>(
        builder: (context, state) {
          return OriaScaffold(
            body: Expanded(
                child: switch (state.currentIndex) {
              0 => const HomeView(),
              1 => const ExploreView(),
              2 => const ExpertView(),
              3 => const ForumView(),
              4 => const TrackerView(),
              5 => const AccountView(),
              _ => const SizedBox(),
            }),
            bottomBarPadding: EdgeInsets.zero,
            bottomNavigationBar: OriaBottomBar(
              items: state.bottomBarItems,
              currentIndex: state.currentIndex,
              onItemPress: (index) => BlocProvider.of<ClientNavigationCubit>(
                context,
              ).changeBottomBarIndex(index),
            ),
          );
        },
      ),
    );
  }
}
