abstract class OnBoardingQuestion {
  final String title;
  set selectedValue(QuestionOption? selectedValue);

  QuestionOption? get selectedValue;

  OnBoardingQuestion({
    required this.title,
  });

  OnBoardingQuestion copyWith({required QuestionOption? selectedValue});
}

abstract class OnBoardingQuestionWithIcon<T> extends OnBoardingQuestion {
  final String iconUrl;
  OnBoardingQuestionWithIcon({required String title, required this.iconUrl})
      : super(
          title: title,
        );
}

abstract class OnBoardingQuestionWithContent<T> extends OnBoardingQuestion {
  final String content;
  OnBoardingQuestionWithContent({required String title, required this.content})
      : super(
          title: title,
        );
}

class OnBoardingQuestionMultiText extends OnBoardingQuestionWithIcon {
  final List<QuestionOption> choices;
  QuestionOption? value;

  @override
  QuestionOption? get selectedValue => value;

  OnBoardingQuestionMultiText({
    required String title,
    required String iconUrl,
    required this.choices,
  }) : super(
          title: title.toString(),
          iconUrl: iconUrl.toString(),
        );

  @override
  OnBoardingQuestionMultiText copyWith(
      {required QuestionOption? selectedValue}) {
    OnBoardingQuestionMultiText onBoardingQuestionMultiText =
        OnBoardingQuestionMultiText(
            title: title, iconUrl: iconUrl, choices: choices);
    onBoardingQuestionMultiText.selectedValue = selectedValue;
    return onBoardingQuestionMultiText;
  }

  @override
  set selectedValue(QuestionOption? selectedValue) {
    value = selectedValue;
  }
}

class OnBoardingQuestionMultiNumber extends OnBoardingQuestionWithIcon {
  final List<QuestionOption> choices;
  final String content;
  QuestionOption? value;

  @override
  QuestionOption? get selectedValue => value;

  OnBoardingQuestionMultiNumber({
    required String title,
    required String iconUrl,
    required this.content,
    required this.choices,
  }) : super(
          title: title,
          iconUrl: iconUrl,
        );

  @override
  set selectedValue(QuestionOption? selectedValue) {
    value = selectedValue;
  }

  @override
  OnBoardingQuestionMultiNumber copyWith(
      {required QuestionOption? selectedValue}) {
    OnBoardingQuestionMultiNumber onBoardingQuestionMultiNumber =
        OnBoardingQuestionMultiNumber(
            title: title, iconUrl: iconUrl, content: content, choices: choices);
    onBoardingQuestionMultiNumber.selectedValue = selectedValue;
    return onBoardingQuestionMultiNumber;
  }
}

class QuestionOption {
  final String answerId;
  final String questionId;
  final String value;

  const QuestionOption(
      {required this.answerId, required this.questionId, required this.value});
}
