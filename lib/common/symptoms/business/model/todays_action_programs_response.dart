import 'package:json_annotation/json_annotation.dart';

import '../../../../client/moduls/explore/business/model/explore_symptom_program_model.dart';

part 'todays_action_programs_response.g.dart';

@JsonSerializable()
class TodaysActionProgramsResponse {
  final List<ProgramSymptomModel> programs;

  const TodaysActionProgramsResponse({
    required this.programs,
  });

  factory TodaysActionProgramsResponse.fromJson(Map<String, dynamic> json) =>
      _$TodaysActionProgramsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TodaysActionProgramsResponseToJson(this);
}
