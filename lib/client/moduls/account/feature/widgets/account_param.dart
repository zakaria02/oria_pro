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
  final Color? titleColor;
  final double imageSize;
  final bool noRaduis;

  const AccountParam({
    super.key,
    this.image,
    required this.title,
    this.titleColor,
    this.icon,
    this.onPress,
    this.onIconPress,
    this.onlyTopRaduis = false,
    this.onlyBottomRaduis = false,
    this.noRaduis = false,
    this.imageSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ?? onIconPress,
      child: OriaCard(
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
              ),
            Visibility(
              visible: image != null,
              child: const SizedBox(
                width: 8,
              ),
            ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontWeight: FontWeight.w700, color: titleColor),
            ),
            const Spacer(),
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
