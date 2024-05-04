import 'package:flutter/material.dart';
import '../enitity/activity.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    super.key,
    required this.activity,
    required this.onCrossPressed,
  });
  final Activity activity;
  final VoidCallback onCrossPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: const Color(0xFF7482CE),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            activity.name,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
          const SizedBox(width: 24),
          GestureDetector(
            onTap: onCrossPressed,
            child: const Icon(
              Icons.close,
              size: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
