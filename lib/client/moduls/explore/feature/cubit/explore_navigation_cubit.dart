import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'explore_navigation_state.dart';

class ExploreNavigationCubit extends Cubit<ExploreNavigationState> {
  ExploreNavigationCubit(List<String> items)
      : super(
          ExploreNavigationState(
            topSelectItems: items,
            currentItem: items.first,
          ),
        );

  void selectItem(String selectedItem) {
    if (!state.topSelectItems.contains(selectedItem)) {
      throw Exception("$selectedItem is not an item from the list");
    }
    emit(
      ExploreNavigationState(
          topSelectItems: state.topSelectItems, currentItem: selectedItem),
    );
  }
}
