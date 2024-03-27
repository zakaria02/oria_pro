import 'package:json_annotation/json_annotation.dart';

part 'onbaording_answer_model.g.dart';

@JsonSerializable()
class OnBoardingAnswerModel {
  @JsonKey(name: "question")
  final String questionId;
  @JsonKey(name: "answers")
  final List<String> answersId;

  const OnBoardingAnswerModel(this.questionId, this.answersId);

  factory OnBoardingAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$OnBoardingAnswerModelFromJson(json);
  Map<String, dynamic> toJson() => _$OnBoardingAnswerModelToJson(this);
}
