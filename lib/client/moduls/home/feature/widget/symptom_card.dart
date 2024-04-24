import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/widgets/oria_card.dart';

import '../../../../../common/symptoms/feature/entity/symptom.dart';
import '../../../../../utils/router/router.dart';

class SymptomCard extends StatelessWidget {
  final Symptom symptom;

  const SymptomCard({
    super.key,
    required this.symptom,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(SymptomDataRoute(symptom: symptom)),
      child: OriaCard(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: symptom.type == SymptomType.primary
            ? OriaColors.green
            : Colors.white,
        borderColor: OriaColors.iconButtonBackgound,
        child: Row(
          children: [
            Image.network(
              symptom.icon,
              height: 48,
              width: 48,
              color: symptom.type == SymptomType.primary
                  ? const Color(0xFFFAF1E1)
                  : Colors.black,
            ),
            const SizedBox(width: 20),
            Text(
              symptom.name,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: symptom.type == SymptomType.primary
                      ? const Color(0xFFFAF1E1)
                      : Colors.black,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}