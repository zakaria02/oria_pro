// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_section_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramSectionWithContentModel _$ProgramSectionWithContentModelFromJson(
        Map<String, dynamic> json) =>
    ProgramSectionWithContentModel(
      description: json['description'] as String,
      type: json['contentType'] as String,
      duration: (json['duration'] as num).toInt(),
      isPremium: json['isPremium'] as bool,
      selectionOrder: (json['sectionOrder'] as num).toInt(),
      title: json['title'] as String,
      imageUrl: json['thumbnail'] as String?,
      programId: json['programId'] as String,
      id: json['id'] as String,
      sectionStatus: json['learningStatus'] as String?,
      content: json['content'] as String,
      videoUrl: json['videoUrl'] as String?,
    );

Map<String, dynamic> _$ProgramSectionWithContentModelToJson(
        ProgramSectionWithContentModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'contentType': instance.type,
      'duration': instance.duration,
      'isPremium': instance.isPremium,
      'sectionOrder': instance.selectionOrder,
      'title': instance.title,
      'thumbnail': instance.imageUrl,
      'programId': instance.programId,
      'id': instance.id,
      'learningStatus': instance.sectionStatus,
      'content': instance.content,
      'videoUrl': instance.videoUrl,
    };
