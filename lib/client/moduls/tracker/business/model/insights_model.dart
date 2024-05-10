import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/expert/business/model/expert_response_model.dart';
import 'package:oria_pro/client/moduls/tracker/feature/enitity/severity_log.dart';

part 'insights_model.g.dart';

@JsonSerializable()
class InsightsModel {
  final List<DataPointsModel> dataPoints;
  final List<String> insights;
  final List<ExpertModel> recommendedExperts;
  final List<DataPointsModel> compareWithDataPoints;

  const InsightsModel({
    required this.dataPoints,
    required this.insights,
    required this.recommendedExperts,
    required this.compareWithDataPoints,
  });

  factory InsightsModel.fromJson(Map<String, dynamic> json) =>
      _$InsightsModelFromJson(json);
  Map<String, dynamic> toJson() => _$InsightsModelToJson(this);
}

@JsonSerializable()
class DataPointsModel {
  final int severity;
  final DateTime logDate;
  final String id;

  const DataPointsModel({
    required this.severity,
    required this.logDate,
    required this.id,
  });

  factory DataPointsModel.fromJson(Map<String, dynamic> json) =>
      _$DataPointsModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataPointsModelToJson(this);
}

extension InsightsModelMappers on InsightsModel {
  Insights toInsights() {
    return Insights(
      logs: dataPoints
          .map(
            (point) => SeverityLog(
              // We need to reverse values 5 become 1 and 1 become 5 and so on, so we can display it correcty in the chart
              severity: 6 - point.severity,
              day: point.logDate,
            ),
          )
          .toList(),
      otherLogs: compareWithDataPoints
          .map(
            (point) => SeverityLog(
              // We need to reverse values 5 become 1 and 1 become 5 and so on, so we can display it correcty in the chart
              severity: 6 - point.severity,
              day: point.logDate,
            ),
          )
          .toList(),
      insights: insights,
      experts: recommendedExperts.map((expert) => expert.toExpert()).toList(),
    );
  }
}
