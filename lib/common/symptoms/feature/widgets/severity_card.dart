import 'package:flutter/material.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';

class SeverityCard extends StatelessWidget {
  const SeverityCard({
    super.key,
    required this.severity,
    required this.onPress,
    required this.selected,
    this.color = Colors.white,
  });

  final int severity;
  final Function(int) onPress;
  final bool selected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(severity),
      child: Container(
        decoration: BoxDecoration(
          color: selected ? OriaColors.green : color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            "$severity",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: selected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
