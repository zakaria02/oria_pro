import 'dart:ui';

extension StringMappers on String {
  Color toColor() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('FF');
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  DateTime toOriaDateTime() {
    final List<String> dateValues = split("-");
    final day = int.parse(dateValues[0]);
    final month = int.parse(dateValues[1]);
    final year = int.parse(dateValues[2]);

    return DateTime(year, month, day);
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
