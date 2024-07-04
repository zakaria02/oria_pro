import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/client/moduls/home/feature/widget/notification_card.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';

import '../../../../../utils/constants/svg_assets.dart';
import '../../../../../widgets/oria_app_bar.dart';
import '../../../../../widgets/oria_scaffold.dart';
import '../bloc/notification_bloc.dart';

@RoutePage()
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late ScrollController _scrollController;
  late VoidCallback scroll;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      bool isBottom = _scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent;
      if (isBottom) {
        scroll();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationBloc()..add(FetchAllNotifications()),
      child: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          scroll = () => BlocProvider.of<NotificationBloc>(context)
              .add(FetchAllNotifications());
          return OriaScaffold(
            appBarData: AppBarData(
              firstButtonUrl: SvgAssets.backAsset,
              onFirstButtonPress: () => context.maybePop(),
              title: AppLocalizations.of(context)!.notifications,
            ),
            body: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (state is NotificationLoading)
                    const Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: OriaLoadingProgress(),
                    ),
                  GestureDetector(
                    onTap: () => BlocProvider.of<NotificationBloc>(context).add(
                      MarkAllNotificationsAsRead(),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.markAllAsRead,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (state.notifications.isNotEmpty)
                    Expanded(
                      child: OriaCard(
                        padding: EdgeInsets.zero,
                        child: ListView.separated(
                          itemBuilder: (context, index) => NotificationCard(
                            notification: state.notifications[index],
                          ),
                          separatorBuilder: (context, index) => const Divider(
                            color: OriaColors.iconButtonBackgound,
                          ),
                          itemCount: state.notifications.length,
                          controller: _scrollController,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
