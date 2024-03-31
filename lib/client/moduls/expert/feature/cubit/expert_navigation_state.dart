part of 'expert_navigation_cubit.dart';

class ExpertNavigationState extends Equatable {
  final List<ExpertTopSelectItem> topSelectItems;
  final ExpertTopSelectItem currentItem;

  const ExpertNavigationState({
    required this.topSelectItems,
    required this.currentItem,
  });

  @override
  List<Object?> get props => [topSelectItems, currentItem];
}
