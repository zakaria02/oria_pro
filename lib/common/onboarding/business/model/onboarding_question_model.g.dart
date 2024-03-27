// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnBoardingQuestionModel _$OnBoardingQuestionModelFromJson(
        Map<String, dynamic> json) =>
    OnBoardingQuestionModel(
      json['description'] as String?,
      json['type'] as String,
      json['maxValue'] as String?,
      json['image'] as String,
      (json['options'] as List<dynamic>)
          .map((e) =>
              OnBoardingQuestionOptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['name'] as String,
      json['id'] as String,
      json['isScale'] as bool,
    );

Map<String, dynamic> _$OnBoardingQuestionModelToJson(
        OnBoardingQuestionModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'type': instance.type,
      'maxValue': instance.maxValue,
      'image': instance.image,
      'options': instance.options,
      'name': instance.name,
      'id': instance.id,
      'isScale': instance.isScale,
    };

OnBoardingQuestionOptionModel _$OnBoardingQuestionOptionModelFromJson(
        Map<String, dynamic> json) =>
    OnBoardingQuestionOptionModel(
      json['_id'] as String,
      json['question'] as String,
      json['text'] as String,
    );

Map<String, dynamic> _$OnBoardingQuestionOptionModelToJson(
        OnBoardingQuestionOptionModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'question': instance.questionId,
      'text': instance.text,
    };
