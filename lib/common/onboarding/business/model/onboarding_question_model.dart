import 'package:json_annotation/json_annotation.dart';

import '../../../../utils/constants/oria_links.dart';
import '../../feature/entity/onboarding_question_entity.dart';

part 'onboarding_question_model.g.dart';

@JsonSerializable()
class OnBoardingQuestionModel {
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "maxValue")
  final String? maxValue;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "options")
  final List<OnBoardingQuestionOptionModel> options;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "isScale")
  final bool isScale;

  const OnBoardingQuestionModel(this.description, this.type, this.maxValue,
      this.image, this.options, this.name, this.id, this.isScale);

  factory OnBoardingQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$OnBoardingQuestionModelFromJson(json);
  Map<String, dynamic> toJson() => _$OnBoardingQuestionModelToJson(this);
}

@JsonSerializable()
class OnBoardingQuestionOptionModel {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "question")
  final String questionId;
  @JsonKey(name: "text")
  final String text;

  const OnBoardingQuestionOptionModel(this.id, this.questionId, this.text);

  factory OnBoardingQuestionOptionModel.fromJson(Map<String, dynamic> json) =>
      _$OnBoardingQuestionOptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$OnBoardingQuestionOptionModelToJson(this);
}

extension OnBoardingQuestionModelMappers on OnBoardingQuestionModel {
  OnBoardingQuestion toOnBoardingQuestion() {
    if (type == "singleChoice") {
      if (isScale) {
        return OnBoardingQuestionMultiNumber(
          title: name,
          content: description!,
          iconUrl: "${OriaLinks.stagingOnBoardingAssetsBaseUrl}/$image",
          choices: options
              .map((option) => QuestionOption(
                  answerId: option.id,
                  questionId: option.questionId,
                  value: option.text))
              .toList(),
        );
      }
      return OnBoardingQuestionMultiText(
        title: name,
        iconUrl: "${OriaLinks.stagingOnBoardingAssetsBaseUrl}/$image",
        choices: options
            .map((option) => QuestionOption(
                answerId: option.id,
                questionId: option.questionId,
                value: option.text))
            .toList(),
      );
    }
    throw Exception("Not implemented yet");
  }
}
