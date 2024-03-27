import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../navigation/bottom_bar_item.dart';

part 'client_navigation_state.dart';

class ClientNavigationCubit extends Cubit<ClientNavigationState> {
  ClientNavigationCubit(List<BottomBarItem> items)
      : super(
          ClientNavigationState(
            bottomBarItems: items,
            currentItem: items[0],
            currentIndex: 0,
          ),
        );

  void changeBottomBarIndex(int selectedIndex) {
    if (selectedIndex >= state.bottomBarItems.length) {
      throw Exception("$selectedIndex is not in the list of items");
    }
    emit(ClientNavigationState(
        bottomBarItems: state.bottomBarItems,
        currentIndex: selectedIndex,
        currentItem: state.bottomBarItems[selectedIndex]));
  }
}
