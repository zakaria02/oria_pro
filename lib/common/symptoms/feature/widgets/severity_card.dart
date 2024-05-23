import 'package:flutter/material.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';

class SeverityCard extends StatelessWidget {
  const SeverityCard({
    super.key,
    required this.severity,
    required this.onPress,
    required this.selected,
  });

  final int severity;
  final Function(int) onPress;
  final bool selected;

  Color get color => switch (severity) {
        0 => const Color(0xFFA8E4C2),
        1 => const Color(0xFFFEF3E0),
        2 => const Color(0xFFFFDAA5),
        3 => const Color(0xFFFF8888),
        4 => const Color(0xFFFF5858),
        _ => OriaColors.disabledColor,
      };

  Color get textColor => switch (severity) {
        0 => const Color(0xFF1C7D45),
        1 => const Color(0xFF8B6525),
        2 => const Color(0xFF835B22),
        3 => const Color(0xFF6D1212),
        4 => const Color(0xFF8E1212),
        _ => OriaColors.disabledColor,
      };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(severity),
      child: SizedBox(
        height: 58,
        width: 48,
        child: Column(
          children: [
            Container(
              height: 48,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  "$severity",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 4),
            if (selected)
              Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 5,
              ),
          ],
        ),
      ),
    );
  }
}
