import 'package:json_annotation/json_annotation.dart';

part 'set_todays_actions_request.g.dart';

@JsonSerializable()
class SetTodaysActionsProgram {
  final String programId;

  const SetTodaysActionsProgram({
    required this.programId,
  });

  factory SetTodaysActionsProgram.fromJson(Map<String, dynamic> json) =>
      _$SetTodaysActionsProgramFromJson(json);
  Map<String, dynamic> toJson() => _$SetTodaysActionsProgramToJson(this);
}
