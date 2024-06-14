import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../widgets/oria_card.dart';

class AccountParam extends StatelessWidget {
  final String? image;
  final String title;
  final Widget? icon;
  final VoidCallback? onPress;
  final VoidCallback? onIconPress;
  final bool onlyTopRaduis;
  final bool onlyBottomRaduis;
  final Color? color;
  final double imageSize;
  final bool noRaduis;
  final EdgeInsets padding;

  const AccountParam({
    super.key,
    this.image,
    required this.title,
    this.color,
    this.icon,
    this.onPress,
    this.onIconPress,
    this.onlyTopRaduis = false,
    this.onlyBottomRaduis = false,
    this.noRaduis = false,
    this.imageSize = 24,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ?? onIconPress,
      child: OriaCard(
        padding: padding,
        backgroundColor: Colors.white,
        onlyBottomRaduis: onlyBottomRaduis,
        onlyTopRaduis: onlyTopRaduis,
        noRaduis: noRaduis,
        child: Row(
          children: [
            if (image != null)
              SvgPicture.asset(
                image!,
                height: imageSize,
                width: imageSize,
                colorFilter: color != null
                    ? ColorFilter.mode(color!, BlendMode.srcIn)
                    : null,
              ),
            Visibility(
              visible: image != null,
              child: const SizedBox(
                width: 8,
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.w700, color: color),
              ),
            ),
            if (icon != null)
              GestureDetector(
                onTap: onIconPress,
                child: icon,
              ),
          ],
        ),
      ),
    );
  }
}
