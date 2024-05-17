import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';

class SeverityCard extends StatelessWidget {
  const SeverityCard({
    super.key,
    required this.severity,
    required this.onPress,
  });
  final int severity;
  final VoidCallback onPress;

  Color get color => switch (severity) {
        0 => const Color(0xFF006400),
        1 => const Color(0xFF9F9F9F),
        _ => Colors.white,
      };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: switch (severity) {
            0 => const Color(0xFFA8E4C2),
            1 => const Color(0xFFFEF3E0),
            2 => const Color(0xFFFFDAA5),
            3 => const Color(0xFFFF8888),
            4 => const Color(0xFFFF5858),
            _ => OriaColors.disabledColor,
          },
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              switch (severity) {
                0 => AppLocalizations.of(context)!.great,
                1 => AppLocalizations.of(context)!.good,
                2 => AppLocalizations.of(context)!.okay,
                3 => AppLocalizations.of(context)!.bad,
                4 => AppLocalizations.of(context)!.awful,
                _ => "",
              },
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: color,
                  ),
            ),
            const SizedBox(width: 24),
            SvgPicture.asset(
              SvgAssets.styloIcon,
              colorFilter: ColorFilter.mode(
                color,
                BlendMode.srcIn,
              ),
            )
          ],
        ),
      ),
    );
  }
}
