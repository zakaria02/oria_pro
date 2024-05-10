import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/expert/business/locator/expert_locator.dart';
import 'package:oria_pro/client/moduls/expert/business/model/city_model.dart';
import 'package:oria_pro/client/moduls/expert/business/repository/expert_repository.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/specialty.dart';

import '../entity/city.dart';

part 'expert_filter_state.dart';

class ExpertFilterCubit extends Cubit<ExpertFilterState> {
  ExpertFilterCubit()
      : super(
          const ExpertFilterState(
            specialty: null,
            cities: [],
            city: null,
            rating: null,
          ),
        );

  void addFilter({Specialty? specialty, City? city, int? rating}) {
    emit(
      ExpertFilterState(
        specialty: specialty,
        cities: state.cities,
        city: city,
        rating: rating,
      ),
    );
  }

  void removeFilter(Type dataType) {
    emit(ExpertFilterState(
      specialty: dataType == Specialty ? null : state.specialty,
      cities: state.cities,
      city: dataType == City ? null : state.city,
      rating: dataType == Int ? null : state.rating,
    ));
  }

  void resetFilters() {
    emit(
      ExpertFilterState(
        specialty: null,
        cities: state.cities,
        city: null,
        rating: null,
      ),
    );
  }

  Future<void> getCities() async {
    ExpertRepository repository = ExpertLocator().get();
    final cities = await repository.getCities();
    cities.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    emit(
      ExpertFilterState(
        specialty: state.specialty,
        cities: cities.map((c) => c.toCity()).toList(),
        city: state.city,
        rating: state.rating,
      ),
    );
  }
}
