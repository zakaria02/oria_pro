import 'package:flutter/material.dart';

import '../../../../widgets/oria_card.dart';
import '../../../../widgets/oria_custom_rounded_input.dart';
import '../entity/onboarding_question_entity.dart';

class FreeInputView extends StatelessWidget {
  const FreeInputView({
    super.key,
    required this.accountDetail,
    required this.hintText,
    this.isDate = false,
    this.onDateChange,
    this.onTextChange,
    this.currentValue,
  }) : assert((isDate && onDateChange != null) ||
            (!isDate && onTextChange != null));

  final OnBoardingQuestionWithContent accountDetail;
  final String hintText;
  final bool isDate;
  final Function(DateTime?)? onDateChange;
  final Function(String?)? onTextChange;
  final String? currentValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: SingleChildScrollView(
          child: OriaCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 11,
                ),
                Text(
                  accountDetail.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  accountDetail.content,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                if (isDate)
                  OriaCustomRoundedDateInput(
                    hintText: hintText,
                    onDateChange: onDateChange!,
                    currentValue: currentValue,
                  )
                else
                  OriaCustomRoundedTextInput(
                    hintText: hintText,
                    onTextChange: onTextChange!,
                    currentValue: currentValue,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
