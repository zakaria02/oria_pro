import 'package:get_it/get_it.dart';

/// [GetIt] locators abstract class that defindes
/// the service used to locate our instances, set them up
/// and get them when needed
abstract class AbstractLocator {
  late GetIt serviceLocator;
  void setUp(GetIt serviceLocator);

  AbstractLocator() {
    serviceLocator = GetIt.instance;
  }

  T get<T extends Object>() {
    return serviceLocator.get<T>();
  }
}
