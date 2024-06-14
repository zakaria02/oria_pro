import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'learn_navigation_state.dart';

class LearnNavigationCubit extends Cubit<LearnNavigationState> {
  LearnNavigationCubit(List<String> items)
      : super(
          LearnNavigationState(
            topSelectItems: items,
            currentItem: items.first,
          ),
        );

  void selectItem(String selectedItem) {
    if (!state.topSelectItems.contains(selectedItem)) {
      throw Exception("$selectedItem is not an item from the list");
    }
    emit(
      LearnNavigationState(
          topSelectItems: state.topSelectItems, currentItem: selectedItem),
    );
  }
}
