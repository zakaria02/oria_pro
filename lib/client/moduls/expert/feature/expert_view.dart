import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/pages/appointments_list.dart';

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
                items: state.topSelectItems,
                selectedItem: state.currentItem,
                onItemPress: (item) =>
                    BlocProvider.of<ExpertNavigationCubit>(context)
                        .selectItem(item),
              ),
              const SizedBox(height: 20),
              Builder(
                builder: (context) {
                  if (state.currentItem == ExpertTopSelect.experts(context)) {
                    return const ExpertsView();
                  }
                  if (state.currentItem ==
                      ExpertTopSelect.appointments(context)) {
                    return const AppointmentListView();
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
