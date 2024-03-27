import 'package:flutter/material.dart';
import 'package:oria_pro/common/symptoms/feature/entity/symptom.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeSymptomCard extends StatelessWidget {
  const HomeSymptomCard({
    super.key,
    required this.symptom,
    required this.onPress,
  });

  final Symptom symptom;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          OriaCard(
            borderColor: OriaColors.iconButtonBackgound,
            width: 126,
            height: 120,
            child: Column(
              children: [
                Image.network(
                  symptom.icon,
                  color: Colors.black,
                  height: 50,
                ),
                const SizedBox(height: 8),
                Text(
                  symptom.name,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Colors.black),
                )
              ],
            ),
          ),
          Visibility(
            visible: symptom.type == SymptomType.primary,
            child: Padding(
              padding: const EdgeInsets.only(left: 33),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF0CB564),
                    borderRadius: BorderRadius.circular(200),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Text(
                    AppLocalizations.of(context)!.primary,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFFFAF8F2),
                      fontFamily: "Statoshi",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
