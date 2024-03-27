import 'package:flutter/material.dart';
import '../../../../utils/constants/oria_colors.dart';
import '../entity/onboarding_question_entity.dart';

class OriaNumberSelect extends StatelessWidget {
  const OriaNumberSelect({
    super.key,
    required this.onPress,
    required this.isSelected,
    required this.option,
  });

  final VoidCallback onPress;
  final bool isSelected;
  final QuestionOption option;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: isSelected ? OriaColors.primaryColor : Colors.white,
        ),
        child: Center(
          child: Text(
            option.value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isSelected ? Colors.white : OriaColors.primaryColor,
                ),
          ),
        ),
      ),
    );
  }
}
