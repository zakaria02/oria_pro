import 'package:flutter/material.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_icon_button.dart';

class TagCard extends StatelessWidget {
  const TagCard({
    super.key,
    required this.tag,
    required this.onDelete,
  });

  final String tag;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: OriaColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "#$tag",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(width: 12),
          OriaIconButton(
            url: SvgAssets.closeAsset,
            size: 12,
            raduis: 12,
            onPress: onDelete,
          )
        ],
      ),
    );
  }
}
