import 'package:oria_pro/client/moduls/expert/business/locator/expert_locator.dart';
import 'package:oria_pro/client/moduls/expert/business/model/create_appointment_request_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/expert_response_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/pay_invoice_request_model.dart';
import 'package:oria_pro/client/moduls/expert/business/repository/expert_repository.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/entity/appointment.dart';

class CreateAppointmentUsecase {
  final ExpertRepository _repository = ExpertLocator().get();

  Future<Appointment> execute(String expertId, DateTime appointmentDate) async {
    final result = await _repository.createAppointment(
        CreateAppointmentRequestModel(
            expertId: expertId, appointmentDate: appointmentDate.toUtc()));
    final invoicePaiement = await _repository.payInvoice(PayInvoiceRequestModel(
        invoiceId: result.invoiceId, paymentReference: "DKJHG231FF"));
    if (invoicePaiement.status == "paid") {
      final expertModel = await _repository.getExpert(result.expertId);
      return Appointment(
        date: result.appointmentDate.toLocal(),
        duration: result.duration,
        expert: expertModel.toExpert(),
      );
    }
    throw Exception("Error while paiment");
  }
}
