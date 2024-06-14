part of 'favorites_navigation_cubit.dart';

class FavoritesNavigationState extends Equatable {
  final List<String> topSelectItems;
  final String currentItem;

  const FavoritesNavigationState({
    required this.topSelectItems,
    required this.currentItem,
  });

  @override
  List<Object> get props => [topSelectItems, currentItem];
}
