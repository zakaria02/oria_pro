import 'package:flutter/material.dart';

import '../entity/onboarding_question_entity.dart';
import 'oria_number_select.dart';

class SelectNumberView extends StatelessWidget {
  const SelectNumberView({
    super.key,
    required this.accountDetail,
    required this.onItemPress,
    required this.selectedValue,
  });

  final OnBoardingQuestionMultiNumber accountDetail;
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
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            accountDetail.content,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 27,
          ),
          GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemCount: accountDetail.choices.length,
            itemBuilder: (context, index) => OriaNumberSelect(
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
