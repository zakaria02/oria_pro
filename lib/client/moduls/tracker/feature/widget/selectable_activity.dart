import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:oria_pro/client/moduls/tracker/feature/enitity/activity.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';

class SelectableActivity extends StatelessWidget {
  const SelectableActivity({
    super.key,
    required this.activity,
    required this.onCheckBoxPress,
    required this.selected,
  });
  final Activity activity;
  final Function(bool) onCheckBoxPress;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          activity.icon,
          height: 32,
        ),
        const SizedBox(width: 12),
        Text(
          activity.name,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const Spacer(),
        CustomCheckBox(
          value: selected,
          checkBoxSize: 24,
          onChanged: (selected) => onCheckBoxPress(selected),
          checkedFillColor: OriaColors.green,
          borderColor: OriaColors.green,
        ),
      ],
    );
  }
}
