import 'package:flutter/material.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/widgets/oria_card.dart';

class PostFilter extends StatelessWidget {
  const PostFilter({
    super.key,
    required this.title,
    required this.onPress,
    required this.selected,
  });
  final String title;
  final VoidCallback onPress;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: OriaCard(
        width: null,
        radius: 32,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        borderColor: selected ? OriaColors.primaryColor : null,
        backgroundColor:
            selected ? OriaColors.scaffoldBackgroundColor : Colors.white,
        child: Text(
          title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
