import 'dart:ui';

class Specialty {
  final String name;
  final String icon;
  final Color color;
  final String id;

  const Specialty({
    required this.color,
    required this.icon,
    required this.id,
    required this.name,
  });

  @override
  String toString() {
    return name;
  }
}
