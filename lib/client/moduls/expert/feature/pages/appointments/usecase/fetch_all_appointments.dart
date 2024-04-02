import 'package:oria_pro/client/moduls/expert/business/model/appointment_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/expert_response_model.dart';
import 'package:oria_pro/client/moduls/expert/business/repository/expert_repository.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/entity/appointment_details.dart';
import 'package:oria_pro/client/moduls/explore/business/di/explore_locator.dart';

import '../../../entity/expert.dart';

class FetchAllAppointmentsUsecase {
  final ExpertRepository _repository = ExploreLocator().get();
  Future<List<AppointmentDetails>> execute() async {
    final result = await _repository.fetchAppointments();
    final notPendingResult = result.where((res) => res.status != "pending");
    final List<Expert> experts = [];
    for (final res in result) {
      final expertModel = await _repository.getExpert(res.expertId);
      experts.add(expertModel.toExpert());
    }
    experts.toSet();
    List<AppointmentDetails> appointments = notPendingResult
        .map((app) => app
            .toAppointment(experts.firstWhere((exp) => exp.id == app.expertId)))
        .toList();
    appointments.sort((a, b) => a.date.compareTo(b.date));
    return appointments;
  }
}
