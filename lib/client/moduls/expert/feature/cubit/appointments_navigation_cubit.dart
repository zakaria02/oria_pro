import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'appointments_navigation_state.dart';

class AppointmentsNavigationCubit extends Cubit<AppointmentsNavigationState> {
  AppointmentsNavigationCubit(List<String> items)
      : super(
          AppointmentsNavigationState(
            topSelectItems: items,
            currentItem: items.first,
          ),
        );

  void selectItem(String selectedItem) {
    if (!state.topSelectItems.contains(selectedItem)) {
      throw Exception("$selectedItem is not an item from the list");
    }
    emit(
      AppointmentsNavigationState(
          topSelectItems: state.topSelectItems, currentItem: selectedItem),
    );
  }
}
