part of 'learn_navigation_cubit.dart';

class LearnNavigationState extends Equatable {
  final List<String> topSelectItems;
  final String currentItem;

  const LearnNavigationState({
    required this.topSelectItems,
    required this.currentItem,
  });

  @override
  List<Object> get props => [topSelectItems, currentItem];
}
