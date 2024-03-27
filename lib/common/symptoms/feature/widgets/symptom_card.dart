import 'package:flutter/material.dart';

import '../../../../utils/constants/oria_colors.dart';
import '../entity/symptom_info.dart';

class SymptomCard extends StatelessWidget {
  const SymptomCard({
    super.key,
    required this.symptom,
    required this.selected,
    required this.onPress,
  });
  final SymptomInfo symptom;
  final bool selected;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 5),
              blurStyle: BlurStyle.inner,
            ),
          ],
          border: selected
              ? Border.all(
                  color: OriaColors.primaryColor,
                  width: 2,
                )
              : null,
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              symptom.icon,
              height: 48,
              width: 48,
              color: OriaColors.primaryColor,
            ),
            const SizedBox(height: 10),
            Text(
              symptom.name,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: OriaColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
