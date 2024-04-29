import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_room_kit/hms_room_kit.dart';

import '../../../../../../../common/auth/business/email_password/locator/email_password_locator.dart';
import '../../../../../../../common/auth/business/local_data_source/auth_local_data_source.dart';
import '../../../../../../../utils/constants/svg_assets.dart';
import '../../../../../../../widgets/oria_app_bar.dart';
import '../../../../../../../widgets/oria_loading_progress.dart';
import '../../../../../../../widgets/oria_no_data_view.dart';
import '../../../../../../../widgets/oria_scaffold.dart';
import '../bloc/appointment_bloc.dart';
import '../entity/appointment_details.dart';

@RoutePage()
class AppointmentCallPage extends StatelessWidget {
  const AppointmentCallPage({
    super.key,
    required this.appointment,
    required this.onLeave,
  });
  final AppointmentDetails appointment;
  final VoidCallback onLeave;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: EmailPasswordAuthLocator().get<AuthLocalDataSource>().getUser(),
      builder: (context, snapshot) {
        return BlocProvider(
          create: (context) => AppointmentBloc()
            ..add(GetRoomCode(appointmentId: appointment.id)),
          child: BlocBuilder<AppointmentBloc, AppointmentState>(
            builder: (context, appointmentState) {
              if (appointmentState is GetRoomCodeSuccess) {
                final user = snapshot.data;
                return HMSPrebuilt(
                  roomCode: appointmentState.roomCode,
                  options: HMSPrebuiltOptions(
                    userId: user?.id,
                    userName: user?.name,
                  ),
                  onLeave: () async {
                    await Future.delayed(const Duration(seconds: 3));
                    onLeave.call();
                  },
                );
              }
              return OriaScaffold(
                appBarData: AppBarData(
                  firstButtonUrl: SvgAssets.backAsset,
                  onFirstButtonPress: () => context.router.maybePop(),
                ),
                body: Builder(
                  builder: (context) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const OriaLoadingProgress();
                    }
                    if (appointmentState is AppointmentError) {
                      return OriaNoDataView(
                          message: appointmentState.errorMessage);
                    }
                    return const SizedBox();
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
