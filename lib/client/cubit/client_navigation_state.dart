part of 'client_navigation_cubit.dart';

class ClientNavigationState extends Equatable {
  final List<BottomBarItem> bottomBarItems;
  final BottomBarItem currentItem;
  final int currentIndex;

  const ClientNavigationState({
    required this.bottomBarItems,
    required this.currentItem,
    required this.currentIndex,
  });

  @override
  List<Object> get props => [bottomBarItems, currentItem, currentIndex];
}
