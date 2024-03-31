import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/entity/day_availability.dart';
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
          eveningAvailabilities: state.eveningAvailabilities,
          selectedDate: state.selectedDate,
        ));
        final availabilities = await usecase.execute(event.expertId, event.day);
        emit(GetDayAvailabilitySuccess(
          morningAvailabilities: availabilities
              .where((date) => date.period == Period.morning)
              .toList(),
          eveningAvailabilities: availabilities
              .where((date) => date.period == Period.evening)
              .toList(),
          selectedDate: state.selectedDate,
        ));
      } catch (e) {
        emit(AppointmentError(
          errorMessage: e.toString(),
          morningAvailabilities: state.morningAvailabilities,
          eveningAvailabilities: state.eveningAvailabilities,
          selectedDate: state.selectedDate,
        ));
      }
    });

    on<SelectDate>((event, emit) async {
      if (event.date.available) {
        emit(SelectDateSuccess(
            morningAvailabilities: state.morningAvailabilities,
            selectedDate: event.date,
            eveningAvailabilities: state.eveningAvailabilities));
      }
    });
  }
}
