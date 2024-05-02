import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/tracker/business/locator/tracker_locator.dart';
import 'package:oria_pro/client/moduls/tracker/business/model/tracked_symptom_model.dart';
import 'package:oria_pro/client/moduls/tracker/business/repository/symptom_tracker_repository.dart';

import '../enitity/tracked_symptom.dart';

part 'tracker_event.dart';
part 'tracker_state.dart';

class TrackerBloc extends Bloc<TrackerEvent, TrackerState> {
  TrackerBloc() : super(const TrackerInitial()) {
    on<FetchSymptomsData>((event, emit) async {
      SymptomTrackerRepository repository = SymptomTrackerLocator().get();
      try {
        emit(TrackedDataLoading(symptoms: state.symptoms));
        final symptoms = await repository.fetchTrackedSymptoms();
        emit(TrackedDataSuccess(
          symptoms: symptoms.map((s) => s.toTrackedSymptom()).toList(),
        ));
      } catch (e) {
        emit(
          TrackedDataError(
              symptoms: state.symptoms, errorMessage: e.toString()),
        );
      }
    });
  }
}
