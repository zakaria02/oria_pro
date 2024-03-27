import 'package:flutter/material.dart';

import '../../../../utils/constants/oria_colors.dart';
import '../entity/onboarding_question_entity.dart';

class OriaTextSelect extends StatelessWidget {
  const OriaTextSelect({
    super.key,
    required this.option,
    this.isSelected = false,
    required this.onPress,
  });
  final QuestionOption option;
  final bool isSelected;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
            ),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isSelected ? OriaColors.primaryColor : Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? OriaColors.primaryColor
                          : OriaColors.disabledColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  option.value,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
