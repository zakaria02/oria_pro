part of 'appointments_navigation_cubit.dart';

class AppointmentsNavigationState extends Equatable {
  final List<String> topSelectItems;
  final String currentItem;

  const AppointmentsNavigationState({
    required this.topSelectItems,
    required this.currentItem,
  });

  @override
  List<Object> get props => [topSelectItems, currentItem];
}
