import 'package:flutter/material.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';

import '../enitity/activity.dart';

class ActivitySelector extends StatelessWidget {
  const ActivitySelector({
    super.key,
    required this.activity,
    required this.onActivitySelect,
    required this.selected,
  });
  final Activity activity;
  final Function(Activity) onActivitySelect;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onActivitySelect(activity),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(
              color: selected
                  ? OriaColors.green
                  : OriaColors.scaffoldBackgroundColor,
            ),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              activity.icon,
              width: 32,
            ),
            const SizedBox(height: 12),
            Text(
              activity.name,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color:
                        selected ? OriaColors.green : OriaColors.primaryColor,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
