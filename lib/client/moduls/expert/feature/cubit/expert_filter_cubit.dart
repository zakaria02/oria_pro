import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/specialty.dart';

part 'expert_filter_state.dart';

class ExpertFilterCubit extends Cubit<ExpertFilterState> {
  ExpertFilterCubit() : super(const ExpertFilterState(specialty: null));

  void addFilter({Specialty? specialty}) {
    emit(ExpertFilterState(
      specialty: specialty,
    ));
  }

  void resetFilters() {
    emit(
      const ExpertFilterState(specialty: null),
    );
  }
}
