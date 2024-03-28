import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants/oria_colors.dart';

class OriaIconButton extends StatelessWidget {
  const OriaIconButton({
    super.key,
    required this.url,
    this.onPress,
    this.raduis = 24,
    this.size = 24,
    this.backgroundColor = OriaColors.iconButtonBackgound,
    this.color,
  });
  final String url;
  final VoidCallback? onPress;
  final double raduis;
  final double size;
  final Color backgroundColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: url.contains(".svg")
          ? CircleAvatar(
              radius: raduis,
              backgroundColor: backgroundColor,
              child: SvgPicture.asset(
                url,
                height: size,
                width: size,
                colorFilter: color != null
                    ? ColorFilter.mode(color!, BlendMode.srcIn)
                    : null,
              ),
            )
          : CircleAvatar(
              radius: raduis,
              backgroundColor: OriaColors.iconButtonBackgound,
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 1),
                child: Image.asset(
                  url,
                  height: size,
                  width: size,
                  color: color,
                ),
              ),
            ),
    );
  }
}
