import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../client/moduls/explore/feature/programs/entity/program.dart';
import '../../../../utils/constants/oria_colors.dart';

class ProgramSeggestionCard extends StatelessWidget {
  const ProgramSeggestionCard({
    super.key,
    required this.program,
    required this.onPress,
    required this.selected,
  });
  final Program program;
  final Function(Program) onPress;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(program),
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: selected ? Border.all(color: OriaColors.primaryColor) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.13),
              blurRadius: 8,
              offset: const Offset(0.0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    program.imageUrl,
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      program.title,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset(
                          SvgAssets.timeAsset,
                          colorFilter: const ColorFilter.mode(
                            OriaColors.primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          AppLocalizations.of(context)!
                              .daysCount(program.duration),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
