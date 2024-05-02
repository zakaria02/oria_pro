import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class LoggerCard extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final color = const Color(0xFF898989);

  const LoggerCard({
    super.key,
    required this.title,
    required this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      radius: const Radius.circular(34),
      strokeWidth: 1,
      dashPattern: const [1, 5],
      color: color,
      borderType: BorderType.RRect,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.add,
            size: 11,
            color: color,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: color,
                ),
          ),
        ],
      ),
    );
  }
}
