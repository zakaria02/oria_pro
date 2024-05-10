import 'package:flutter/material.dart';
import 'package:oria_pro/utils/extensions/string_extensions.dart';

import '../../../../../utils/constants/oria_colors.dart';
import '../enitity/chart_period.dart';

class PeriodSelector extends StatelessWidget {
  const PeriodSelector({
    super.key,
    required this.period,
    required this.isSelected,
    required this.onPress,
  });
  final ChartDataPeriod period;
  final bool isSelected;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isSelected ? OriaColors.green : Colors.white,
          ),
          child: Text(
            period.name.toString().capitalize(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: isSelected ? Colors.white : OriaColors.green,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
