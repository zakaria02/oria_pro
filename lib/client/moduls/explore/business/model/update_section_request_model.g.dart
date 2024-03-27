// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_section_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateSectionRequestModel _$UpdateSectionRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateSectionRequestModel(
      programId: json['programId'] as String,
      sectionId: json['sectionId'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$UpdateSectionRequestModelToJson(
        UpdateSectionRequestModel instance) =>
    <String, dynamic>{
      'programId': instance.programId,
      'sectionId': instance.sectionId,
      'status': instance.status,
    };
