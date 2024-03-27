part of 'explore_navigation_cubit.dart';

class ExploreNavigationState extends Equatable {
  final List<String> topSelectItems;
  final String currentItem;

  const ExploreNavigationState({
    required this.topSelectItems,
    required this.currentItem,
  });

  @override
  List<Object> get props => [topSelectItems, currentItem];
}
