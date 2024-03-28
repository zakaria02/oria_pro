part of 'expert_navigation_cubit.dart';

class ExpertNavigationState extends Equatable {
  final List<String> topSelectItems;
  final String currentItem;

  const ExpertNavigationState({
    required this.topSelectItems,
    required this.currentItem,
  });

  @override
  List<Object> get props => [topSelectItems, currentItem];
}
