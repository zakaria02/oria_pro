import 'package:flutter/material.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_icon_button.dart';

class FilterCard extends StatelessWidget {
  const FilterCard({
    super.key,
    required this.title,
    required this.onPress,
  });

  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: Colors.black, fontFamily: "Satoshi"),
          ),
          const SizedBox(width: 20),
          OriaIconButton(
            url: SvgAssets.closeAsset,
            onPress: onPress,
            size: 14,
            raduis: 14,
            backgroundColor: OriaColors.disabledColor,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
