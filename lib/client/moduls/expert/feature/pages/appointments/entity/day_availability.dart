class DayAvailability {
  final DateTime date;
  final Period period;
  final bool available;

  const DayAvailability(
      {required this.date, required this.period, required this.available});
}

enum Period { morning, afternoon, evening }
