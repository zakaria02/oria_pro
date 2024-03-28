import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'expert_navigation_state.dart';

class ExpertNavigationCubit extends Cubit<ExpertNavigationState> {
  ExpertNavigationCubit(List<String> items)
      : super(
          ExpertNavigationState(
            topSelectItems: items,
            currentItem: items.first,
          ),
        );

  void selectItem(String selectedItem) {
    if (!state.topSelectItems.contains(selectedItem)) {
      throw Exception("$selectedItem is not an item from the list");
    }
    emit(
      ExpertNavigationState(
          topSelectItems: state.topSelectItems, currentItem: selectedItem),
    );
  }
}
