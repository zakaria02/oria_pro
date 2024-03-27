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
  });
  final String url;
  final VoidCallback? onPress;
  final double raduis;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: url.contains(".svg")
          ? CircleAvatar(
              radius: raduis,
              backgroundColor: OriaColors.iconButtonBackgound,
              child: SvgPicture.asset(
                url,
                height: size,
                width: size,
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
                ),
              ),
            ),
    );
  }
}
