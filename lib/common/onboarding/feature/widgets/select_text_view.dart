import 'package:flutter/material.dart';

import '../entity/onboarding_question_entity.dart';
import 'oria_text_select.dart';

class SelectTextView extends StatelessWidget {
  const SelectTextView({
    super.key,
    required this.accountDetail,
    required this.onItemPress,
    required this.selectedValue,
  });

  final OnBoardingQuestionMultiText accountDetail;
  final Function(QuestionOption) onItemPress;
  final QuestionOption? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView(
        children: [
          SizedBox(
            height: 300,
            child: Image.network(
              accountDetail.iconUrl,
            ),
          ),
          Text(
            accountDetail.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontFamily: "Raleway"),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: accountDetail.choices.length,
            itemBuilder: (context, index) => OriaTextSelect(
              option: accountDetail.choices[index],
              onPress: () => onItemPress(accountDetail.choices[index]),
              isSelected: selectedValue == accountDetail.choices[index],
            ),
          ),
          const SizedBox(
            height: 76,
          ),
        ],
      ),
    );
  }
}
