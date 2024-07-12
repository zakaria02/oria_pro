import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/expert/business/model/add_review_request_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/appointment_model.dart';
import 'package:oria_pro/client/moduls/expert/business/model/expert_response_model.dart';
import 'package:oria_pro/client/moduls/expert/business/repository/expert_repository.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/entity/appointment.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/entity/appointment_details.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/entity/day_availability.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/usecase/create_appointment_usecase.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/usecase/fetch_all_appointments.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/usecase/get_day_availabilities_use_case.dart';
import 'package:oria_pro/client/moduls/explore/business/di/explore_locator.dart';

import '../../../../business/locator/expert_locator.dart';

//import '../../../../business/locator/expert_locator.dart';

part 'appointment_event.dart';
part 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc() : super(const AppointmentInitial()) {
    on<GetDayAvailabilities>((event, emit) async {
      try {
        final GetDayAvailabilitiesUseCase usecase = ExploreLocator().get();
        emit(GetDayAvailabilityLoading(
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
        ));
        final availabilities = await usecase.execute(event.expertId, event.day);
        emit(GetDayAvailabilitySuccess(
          morningAvailabilities: availabilities
              .where((date) => date.period == Period.morning)
              .toList(),
          afternoonAvailabilities: availabilities
              .where((date) => date.period == Period.afternoon)
              .toList(),
          eveningAvailabilities: availabilities
              .where((date) => date.period == Period.evening)
              .toList(),
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
          previous: state.previous,
          upcoming: state.upcoming,
        ));
      } catch (e) {
        emit(AppointmentError(
          errorMessage: e.toString(),
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
        ));
      }
    });

    on<SelectDate>((event, emit) async {
      if (event.date.available) {
        emit(SelectDateSuccess(
          morningAvailabilities: state.morningAvailabilities,
          selectedDate: event.date,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          currentAppointment: state.currentAppointment,
          previous: state.previous,
          upcoming: state.upcoming,
        ));
      }
    });

    on<CreateAppointment>((event, emit) async {
      try {
        final CreateAppointmentUsecase usecase = ExploreLocator().get();
        emit(CreateAppointmentLoading(
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
        ));
        final appointment = await usecase.execute(
            event.expertId, event.appointmentDate.toUtc());
        emit(
          CreateAppointmentSuccess(
            morningAvailabilities: state.morningAvailabilities,
            afternoonAvailabilities: state.afternoonAvailabilities,
            eveningAvailabilities: state.eveningAvailabilities,
            previous: state.previous,
            upcoming: state.upcoming,
            selectedDate: state.selectedDate,
            currentAppointment: state.currentAppointment,
            appointment: appointment,
          ),
        );
      } catch (e) {
        emit(AppointmentError(
          errorMessage: "Error occured",
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
        ));
      }
    });

    on<FetchAllAppointments>((event, emit) async {
      try {
        final FetchAllAppointmentsUsecase usecase = ExploreLocator().get();
        emit(FetchAllAppointmentsLoading(
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
        ));
        final appointments = await usecase.execute(isUpcoming: false);
        emit(FetchAllAppointmentsSuccess(
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: appointments,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
        ));
      } catch (e) {
        emit(AppointmentError(
          errorMessage: e.toString(),
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
        ));
      }
    });

    on<FetchAppointment>((event, emit) async {
      try {
        final ExpertRepository repository = ExploreLocator().get();
        emit(FetchCurrentAppointmentLoading(
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
        ));
        final appointment = await repository.fetchAppointment(event.id);
        final expert = await repository.getExpert(appointment.expertId);
        emit(FetchCurrentAppointmentSuccess(
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          currentAppointment: appointment.toAppointment(expert.toExpert()),
        ));
      } catch (e) {
        emit(AppointmentError(
          errorMessage: e.toString(),
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
        ));
      }
    });

    on<FetchUpcomingAppointments>((event, emit) async {
      try {
        final FetchAllAppointmentsUsecase usecase = ExploreLocator().get();
        emit(FetchAllAppointmentsLoading(
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
        ));
        final appointments = await usecase.execute(isUpcoming: true);
        final upcoming = appointments
            .where((app) => app.date.isAfter(DateTime.now()))
            .toList();
        emit(FetchAllAppointmentsSuccess(
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
          upcoming: upcoming,
        ));
      } catch (e) {
        emit(AppointmentError(
          errorMessage: e.toString(),
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
        ));
      }
    });

    on<CancelAppointment>((event, emit) async {
      try {
        final ExpertRepository repository = ExploreLocator().get();
        emit(CancelAppointmentLoading(
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
        ));
        await repository.cancelAppointment(event.id);
        emit(CancelAppointmentSuccess(
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
        ));
        add(FetchAllAppointments());
        add(FetchUpcomingAppointments());
      } catch (e) {
        emit(AppointmentError(
          errorMessage: e.toString(),
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
        ));
      }
    });

    on<GetRoomCode>((event, emit) async {
      ExpertRepository repository = ExpertLocator().get();
      try {
        emit(GetRoomCodeLoading(
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
        ));
        final String roomCode =
            (await repository.getMeetingAccessKey(event.appointmentId)).key;
        emit(GetRoomCodeSuccess(
          roomCode: roomCode,
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
        ));
      } catch (e) {
        emit(AppointmentError(
          errorMessage: e.toString(),
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          currentAppointment: state.currentAppointment,
        ));
      }
    });

    on<AddReview>((event, emit) async {
      ExpertRepository repository = ExpertLocator().get();
      repository.addReview(AddReviewRequestModel(
          appointementId: event.appointmentId,
          rating: event.rating,
          review: event.review));
    });
  }
}
