import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorites_navigation_state.dart';

class FavoritesNavigationCubit extends Cubit<FavoritesNavigationState> {
  FavoritesNavigationCubit(List<String> items)
      : super(
          FavoritesNavigationState(
            topSelectItems: items,
            currentItem: items.first,
          ),
        );

  void selectItem(String selectedItem) {
    if (!state.topSelectItems.contains(selectedItem)) {
      throw Exception("$selectedItem is not an item from the list");
    }
    emit(
      FavoritesNavigationState(
          topSelectItems: state.topSelectItems, currentItem: selectedItem),
    );
  }
}
