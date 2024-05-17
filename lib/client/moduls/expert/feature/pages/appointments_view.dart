import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/pages/appointments_list.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/pages/appointments_upcoming_view.dart';

import '../../../../../widgets/oria_top_select.dart';
import '../cubit/appointments_navigation_cubit.dart';
import '../entity/expert_top_select.dart';

class AppointmentsView extends StatelessWidget {
  const AppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => AppointmentsNavigationCubit(
                ExpertTopSelect.appointmentItems(context))),
      ],
      child:
          BlocBuilder<AppointmentsNavigationCubit, AppointmentsNavigationState>(
        builder: (context, state) {
          return Expanded(
            child: Column(
              children: [
                const SizedBox(height: 20),
                OriaTopBarSelect(
                  items: state.topSelectItems,
                  selectedItem: state.currentItem,
                  onItemPress: (item) =>
                      BlocProvider.of<AppointmentsNavigationCubit>(context)
                          .selectItem(item),
                  padding: EdgeInsets.zero,
                ),
                const SizedBox(height: 20),
                Builder(
                  builder: (context) {
                    if (state.currentItem ==
                        ExpertTopSelect.upcoming(context)) {
                      return const UpcomingAppointmentListView();
                    }
                    if (state.currentItem ==
                        ExpertTopSelect.previous(context)) {
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
            ),
          );
        },
      ),
    );
  }
}
