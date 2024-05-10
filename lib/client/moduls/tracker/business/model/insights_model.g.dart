// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insights_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsightsModel _$InsightsModelFromJson(Map<String, dynamic> json) =>
    InsightsModel(
      dataPoints: (json['dataPoints'] as List<dynamic>)
          .map((e) => DataPointsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      insights:
          (json['insights'] as List<dynamic>).map((e) => e as String).toList(),
      recommendedExperts: (json['recommendedExperts'] as List<dynamic>)
          .map((e) => ExpertModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      compareWithDataPoints: (json['compareWithDataPoints'] as List<dynamic>)
          .map((e) => DataPointsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InsightsModelToJson(InsightsModel instance) =>
    <String, dynamic>{
      'dataPoints': instance.dataPoints,
      'insights': instance.insights,
      'recommendedExperts': instance.recommendedExperts,
      'compareWithDataPoints': instance.compareWithDataPoints,
    };

DataPointsModel _$DataPointsModelFromJson(Map<String, dynamic> json) =>
    DataPointsModel(
      severity: json['severity'] as int,
      logDate: DateTime.parse(json['logDate'] as String),
      id: json['id'] as String,
    );

Map<String, dynamic> _$DataPointsModelToJson(DataPointsModel instance) =>
    <String, dynamic>{
      'severity': instance.severity,
      'logDate': instance.logDate.toIso8601String(),
      'id': instance.id,
    };
