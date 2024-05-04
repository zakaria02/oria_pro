import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/tracker/feature/widget/selectable_activity.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../utils/constants/oria_colors.dart';
import '../bloc/tracker_bloc.dart';
import '../enitity/activity.dart';

class EditActivitiesPage extends StatelessWidget {
  const EditActivitiesPage({
    super.key,
    required this.activites,
  });
  final List<Activity> activites;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackerBloc, TrackerState>(
      builder: (blocContext, state) {
        return OriaScaffold(
          appBarData: AppBarData(
            firstButtonUrl: SvgAssets.backAsset,
            onFirstButtonPress: () => context.maybePop(),
            title: AppLocalizations.of(context)!.activities,
          ),
          body: Expanded(
            child: Column(
              children: [
                const SizedBox(height: 24),
                if (state is FetchLocalActivitiesLoading)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: OriaLoadingProgress(),
                  ),
                Text(
                  AppLocalizations.of(context)!.showOrHideActivities,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: OriaColors.grey,
                      ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 42),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => SelectableActivity(
                    activity: activites[index],
                    onCheckBoxPress: (selected) {
                      BlocProvider.of<TrackerBloc>(context).add(
                          UpdateLocalActivity(
                              selected: selected, activity: activites[index]));
                    },
                    selected: state.savedActivities
                        .where((act) => activites[index].id == act.id)
                        .isNotEmpty,
                  ),
                  itemCount: activites.length,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
