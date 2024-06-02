import 'package:flutter/material.dart';
import 'package:oria_pro/widgets/oria_card.dart';

import '../../../../../../widgets/oria_icon_button.dart';

class PostMenuItem extends StatelessWidget {
  const PostMenuItem({
    super.key,
    this.title,
    required this.icon,
    required this.onPress,
    this.color,
  });
  final String? title;
  final String icon;
  final VoidCallback onPress;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Align(
        alignment: Alignment.topRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (title != null) ...[
              OriaCard(
                padding: const EdgeInsets.all(15),
                radius: 50,
                width: null,
                child: Text(
                  title!,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: color),
                ),
              ),
              const SizedBox(width: 8),
            ],
            OriaIconButton(
              url: icon,
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
