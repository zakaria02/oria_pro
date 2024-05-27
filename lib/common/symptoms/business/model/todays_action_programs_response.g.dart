// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todays_action_programs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodaysActionProgramsResponse _$TodaysActionProgramsResponseFromJson(
        Map<String, dynamic> json) =>
    TodaysActionProgramsResponse(
      programs: (json['programs'] as List<dynamic>)
          .map((e) => ProgramSymptomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TodaysActionProgramsResponseToJson(
        TodaysActionProgramsResponse instance) =>
    <String, dynamic>{
      'programs': instance.programs,
    };
