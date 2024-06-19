// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramModel _$ProgramModelFromJson(Map<String, dynamic> json) => ProgramModel(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['thumbnail'] as String,
      description: json['description'] as String,
      duration: (json['duration'] as num).toInt(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      author: AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
      sections: (json['sections'] as List<dynamic>)
          .map((e) => ProgramSectionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isPremium: json['isPremium'] as bool,
      programStatus: json['learningStatus'] as String,
      isFavourite: json['isFavourite'] as bool? ?? false,
    );

Map<String, dynamic> _$ProgramModelToJson(ProgramModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnail': instance.imageUrl,
      'description': instance.description,
      'duration': instance.duration,
      'tags': instance.tags,
      'author': instance.author,
      'sections': instance.sections,
      'isPremium': instance.isPremium,
      'learningStatus': instance.programStatus,
      'isFavourite': instance.isFavourite,
    };

ProgramSectionModel _$ProgramSectionModelFromJson(Map<String, dynamic> json) =>
    ProgramSectionModel(
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
    );

Map<String, dynamic> _$ProgramSectionModelToJson(
        ProgramSectionModel instance) =>
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
    };
