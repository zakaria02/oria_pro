import 'package:flutter/material.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';

class OriaDot extends StatelessWidget {
  const OriaDot({
    super.key,
    this.primaryColor = OriaColors.primaryColor,
    this.backgroundColor = OriaColors.iconButtonBackgound,
  });

  final Color primaryColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        Positioned(
          bottom: 6,
          left: 6,
          child: Container(
            height: 12,
            width: 12,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )
      ],
    );
  }
}
