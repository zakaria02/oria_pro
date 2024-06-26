import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../widgets/oria_top_select.dart';
import 'cubit/expert_navigation_cubit.dart';
import 'entity/expert_top_select.dart';
import 'pages/experts/experts_view.dart';

class ExpertView extends StatelessWidget {
  const ExpertView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                ExpertNavigationCubit(ExpertTopSelect.items(context))),
      ],
      child: BlocBuilder<ExpertNavigationCubit, ExpertNavigationState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 20),
              OriaTopBarSelect(
                fontSize: 12,
                items: state.topSelectItems,
                selectedItem: state.currentItem,
                onItemPress: (item) =>
                    BlocProvider.of<ExpertNavigationCubit>(context)
                        .selectItem(item),
              ),
              Builder(
                builder: (context) {
                  if (state.currentItem == ExpertTopSelect.experts(context)) {
                    return const ExpertsView();
                  }
                  if (state.currentItem ==
                      ExpertTopSelect.appointments(context)) {
                    return const AppointmentsView();
                  }
                  if (state.currentItem ==
                      ExpertTopSelect.marketpalace(context)) {
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
          );
        },
      ),
    );
  }
}
