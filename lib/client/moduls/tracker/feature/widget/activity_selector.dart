import 'package:flutter/material.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';

import '../../../../../widgets/oria_card.dart';
import '../enitity/activity.dart';

class ActivitySelector extends StatelessWidget {
  const ActivitySelector({
    super.key,
    required this.activity,
    required this.onActivitySelect,
    required this.selected,
    required this.disabled,
  });
  final Activity activity;
  final Function(Activity) onActivitySelect;
  final bool selected;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!disabled) {
          onActivitySelect(activity);
        }
      },
      child: OriaCard(
        borderColor: selected ? OriaColors.green : null,
        backgroundColor: disabled ? OriaColors.green : Colors.white,
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              activity.icon,
              width: 32,
              color: disabled ? Colors.white : OriaColors.primaryColor,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                activity.name,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: disabled
                          ? Colors.white
                          : selected
                              ? OriaColors.green
                              : OriaColors.primaryColor,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
