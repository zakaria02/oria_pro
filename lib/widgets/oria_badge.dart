import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';

import '../utils/constants/oria_colors.dart';

class OriaBadge extends StatelessWidget {
  const OriaBadge({
    super.key,
    required this.title,
    this.isTime = true,
  });
  final String title;
  final bool isTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: OriaColors.green,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 20,
      padding: const EdgeInsets.only(top: 2, bottom: 2, right: 10, left: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isTime) SvgPicture.asset(SvgAssets.timeAsset),
          if (!isTime) const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                  fontFamily: "Satoshi",
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
