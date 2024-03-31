import 'dart:ui';

extension StringMappers on String {
  Color toColor() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('FF');
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  DateTime toOriaDateTime() {
    final day = int.parse(substring(0, 2));
    final month = int.parse(substring(3, 5));
    final year = int.parse(substring(6, 9));

    return DateTime(year, month, day).toUtc();
  }
}
