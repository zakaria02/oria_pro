import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:oria_pro/client/moduls/tracker/business/locator/tracker_locator.dart';
import 'package:oria_pro/client/moduls/tracker/business/model/add_symptom_activity_model.dart';
import 'package:oria_pro/client/moduls/tracker/business/model/add_symptom_severity_model.dart';
import 'package:oria_pro/client/moduls/tracker/business/model/insights_model.dart';
import 'package:oria_pro/client/moduls/tracker/business/model/tracked_symptom_model.dart';
import 'package:oria_pro/client/moduls/tracker/business/repository/symptom_tracker_repository.dart';
import 'package:oria_pro/client/moduls/tracker/business/service/symptom_tracker_local_ds.dart';
import 'package:oria_pro/client/moduls/tracker/feature/enitity/severity_log.dart';
import 'package:oria_pro/client/moduls/tracker/feature/usecase/fetch_activities_use_case.dart';

import '../enitity/activity.dart';
import '../enitity/tracked_symptom.dart';
import '../usecase/get_activities_use_case.dart';

part 'tracker_event.dart';
part 'tracker_state.dart';

class TrackerBloc extends Bloc<TrackerEvent, TrackerState> {
  TrackerBloc() : super(const TrackerInitial()) {
    final SymptomTrackerRepository repository = SymptomTrackerLocator().get();

    on<FetchSymptomsData>((event, emit) async {
      try {
        emit(TrackedDataLoading(
          symptoms: state.symptoms,
          activities: state.activities,
          savedActivities: state.savedActivities,
          selectedDate: state.selectedDate,
          insights: state.insights,
        ));
        final symptomsModel =
            await repository.fetchTrackedSymptoms(state.selectedDate);
        final symptoms =
            symptomsModel.map((s) => s.toTrackedSymptom()).toList();
        symptoms.sort((a, b) {
          if (a.isPrimary && !b.isPrimary) {
            return -1;
          } else if (!a.isPrimary && b.isPrimary) {
            return 1;
          } else {
            return 0;
          }
        });
        emit(
          TrackedDataSuccess(
            activities: state.activities,
            savedActivities: state.savedActivities,
            symptoms: symptoms,
            selectedDate: state.selectedDate,
            insights: state.insights,
          ),
        );
      } catch (e) {
        emit(
          TrackedDataError(
            symptoms: state.symptoms,
            activities: state.activities,
            savedActivities: state.savedActivities,
            errorMessage: e.toString(),
            selectedDate: state.selectedDate,
            insights: state.insights,
          ),
        );
      }
    });

    on<RemoveSymptomActivity>((event, emit) async {
      try {
        emit(TrackedDataLoading(
          symptoms: state.symptoms,
          activities: state.activities,
          savedActivities: state.savedActivities,
          selectedDate: state.selectedDate,
          insights: state.insights,
        ));
        await repository.removeSymptomActivity(
            event.logEventId, event.activityId);
        add(FetchSymptomsData());
      } catch (e) {
        emit(
          TrackedDataError(
            symptoms: state.symptoms,
            activities: state.activities,
            savedActivities: state.savedActivities,
            errorMessage: e.toString(),
            selectedDate: state.selectedDate,
            insights: state.insights,
          ),
        );
      }
    });

    on<AddSymptomSeverity>((event, emit) async {
      try {
        emit(AddSymptomSeverityLoading(
          symptoms: state.symptoms,
          activities: state.activities,
          savedActivities: state.savedActivities,
          selectedDate: state.selectedDate,
          insights: state.insights,
        ));
        await repository.addSymptomSeverity(AddSymptomSeverityModel(
          symptom: event.symptomId,
          severity: event.severity,
          logDate: state.selectedDate,
        ));
        emit(AddSymptomSeveritySuccess(
          symptoms: state.symptoms,
          activities: state.activities,
          savedActivities: state.savedActivities,
          selectedDate: state.selectedDate,
          insights: state.insights,
        ));
        add(FetchSymptomsData());
      } catch (e) {
        emit(
          TrackedDataError(
            symptoms: state.symptoms,
            activities: state.activities,
            savedActivities: state.savedActivities,
            errorMessage: e.toString(),
            selectedDate: state.selectedDate,
            insights: state.insights,
          ),
        );
      }
    });

    on<GetSymptomInsights>((event, emit) async {
      try {
        emit(GetInsightsLoading(
          symptoms: state.symptoms,
          activities: state.activities,
          selectedDate: state.selectedDate,
          insights: state.insights,
        ));
        final symptomInsights = await repository.getSymptomInsights(
            event.symptomId, event.endDate, event.startDate, event.compareWith);
        emit(GetInsightsSuccess(
          symptoms: state.symptoms,
          activities: state.activities,
          savedActivities: state.savedActivities,
          selectedDate: state.selectedDate,
          insights: symptomInsights.toInsights(),
        ));
      } catch (e) {
        emit(
          TrackedDataError(
            symptoms: state.symptoms,
            activities: state.activities,
            savedActivities: state.savedActivities,
            errorMessage: e.toString(),
            selectedDate: state.selectedDate,
            insights: state.insights,
          ),
        );
      }
    });

    on<AddSymptomActivity>((event, emit) async {
      try {
        emit(AddSymptomActivityLoading(
          symptoms: state.symptoms,
          activities: state.activities,
          savedActivities: state.savedActivities,
          selectedDate: state.selectedDate,
          insights: state.insights,
        ));
        await repository.addSymptomActivity(
          AddSymptomActivityModel(
            activityId: event.activityId,
            logEventId: event.logEventId,
          ),
        );
        emit(AddSymptomActivitySuccess(
          symptoms: state.symptoms,
          activities: state.activities,
          savedActivities: state.savedActivities,
          selectedDate: state.selectedDate,
          insights: state.insights,
        ));
        add(FetchSymptomsData());
      } catch (e) {
        emit(
          TrackedDataError(
            symptoms: state.symptoms,
            activities: state.activities,
            savedActivities: state.savedActivities,
            errorMessage: e.toString(),
            selectedDate: state.selectedDate,
            insights: state.insights,
          ),
        );
      }
    });

    on<FetchActivities>((event, emit) async {
      FetchActivityUseCase usecase = SymptomTrackerLocator().get();
      try {
        emit(FetchActivitiesLoading(
          symptoms: state.symptoms,
          savedActivities: state.savedActivities,
          selectedDate: state.selectedDate,
          insights: state.insights,
        ));
        final activities = await usecase.execute();
        emit(FetchActivitiesSuccess(
          symptoms: state.symptoms,
          activities: activities,
          savedActivities: state.savedActivities,
          selectedDate: state.selectedDate,
          insights: state.insights,
        ));
        add(FetchSymptomsData());
      } catch (e) {
        emit(
          TrackedDataError(
            symptoms: state.symptoms,
            activities: state.activities,
            savedActivities: state.savedActivities,
            errorMessage: e.toString(),
            selectedDate: state.selectedDate,
            insights: state.insights,
          ),
        );
      }
    });

    on<FetchLocalActivities>((event, emit) async {
      GetActivityUseCase usecase = SymptomTrackerLocator().get();
      try {
        emit(FetchLocalActivitiesLoading(
          symptoms: state.symptoms,
          activities: state.activities,
          selectedDate: state.selectedDate,
          insights: state.insights,
        ));
        final activities = await usecase.execute();
        emit(FetchLocalActivitiesSuccess(
          symptoms: state.symptoms,
          activities: state.activities,
          savedActivities: activities,
          selectedDate: state.selectedDate,
          insights: state.insights,
        ));
      } catch (e) {
        emit(
          TrackedDataError(
            symptoms: state.symptoms,
            activities: state.activities,
            savedActivities: state.savedActivities,
            errorMessage: e.toString(),
            selectedDate: state.selectedDate,
            insights: state.insights,
          ),
        );
      }
    });

    on<UpdateLocalActivity>((event, emit) async {
      SymptomTrackerDataSource ds = SymptomTrackerLocator().get();
      try {
        final selectableActivity = event.activity.toSelectableActivity();
        if (event.selected) {
          ds.saveActivity(selectableActivity);
        } else {
          ds.deleteactivity(selectableActivity);
        }
        add(FetchLocalActivities());
      } catch (e) {
        emit(
          TrackedDataError(
            symptoms: state.symptoms,
            activities: state.activities,
            savedActivities: state.savedActivities,
            errorMessage: e.toString(),
            selectedDate: state.selectedDate,
            insights: state.insights,
          ),
        );
      }
    });

    on<SelectDate>((event, emit) async {
      emit(
        TrackedDataSuccess(
          symptoms: state.symptoms,
          activities: state.activities,
          savedActivities: state.savedActivities,
          selectedDate: event.selectedDate,
          insights: state.insights,
        ),
      );
    });
  }
}
