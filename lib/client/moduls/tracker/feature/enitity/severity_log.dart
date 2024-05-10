import 'package:oria_pro/client/moduls/expert/feature/entity/expert.dart';

class Insights {
  final List<SeverityLog> logs;
  final List<SeverityLog> otherLogs;
  final List<String> insights;
  final List<Expert> experts;

  const Insights({
    required this.logs,
    required this.otherLogs,
    required this.insights,
    required this.experts,
  });
}

class SeverityLog {
  final int severity;
  final DateTime day;

  const SeverityLog({
    required this.severity,
    required this.day,
  });
}
