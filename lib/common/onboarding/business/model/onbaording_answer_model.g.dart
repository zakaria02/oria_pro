// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onbaording_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnBoardingAnswerModel _$OnBoardingAnswerModelFromJson(
        Map<String, dynamic> json) =>
    OnBoardingAnswerModel(
      json['question'] as String,
      (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$OnBoardingAnswerModelToJson(
        OnBoardingAnswerModel instance) =>
    <String, dynamic>{
      'question': instance.questionId,
      'answers': instance.answersId,
    };
