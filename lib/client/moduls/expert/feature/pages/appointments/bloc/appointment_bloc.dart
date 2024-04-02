import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/expert/business/repository/expert_repository.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/entity/appointment.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/entity/appointment_details.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/entity/day_availability.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/usecase/create_appointment_usecase.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/usecase/fetch_all_appointments.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/usecase/get_day_availabilities_use_case.dart';
import 'package:oria_pro/client/moduls/explore/business/di/explore_locator.dart';

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
        ));
        final appointment =
            await usecase.execute(event.expertId, event.appointmentDate);
        emit(CreateAppointmentSuccess(
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
          appointment: appointment,
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
        ));
        final appointments = await usecase.execute(isUpcoming: false);
        emit(FetchAllAppointmentsSuccess(
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: appointments,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
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
        ));
        final appointments = await usecase.execute(isUpcoming: true);
        emit(FetchAllAppointmentsSuccess(
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          selectedDate: state.selectedDate,
          upcoming: appointments,
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
        ));
        await repository.cancelAppointment(event.id);
        emit(CancelAppointmentSuccess(
          morningAvailabilities: state.morningAvailabilities,
          afternoonAvailabilities: state.afternoonAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          previous: state.previous,
          upcoming: state.upcoming,
          selectedDate: state.selectedDate,
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
        ));
      }
    });
  }
}
