import 'package:json_annotation/json_annotation.dart';

part 'add_symptom_activity_model.g.dart';

@JsonSerializable()
class AddSymptomActivityModel {
  final String logEventId;
  final String activityId;

  const AddSymptomActivityModel({
    required this.logEventId,
    required this.activityId,
  });

  factory AddSymptomActivityModel.fromJson(Map<String, dynamic> json) =>
      _$AddSymptomActivityModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddSymptomActivityModelToJson(this);
}
