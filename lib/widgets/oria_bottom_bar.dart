import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../client/navigation/bottom_bar_item.dart';

class OriaBottomBar extends StatelessWidget {
  const OriaBottomBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onItemPress,
  });
  final List<BottomBarItem> items;
  final int currentIndex;
  final Function(int) onItemPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: OriaColors.green,
      ),
      child: SalomonBottomBar(
        itemPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        margin: const EdgeInsets.all(4),
        currentIndex: currentIndex,
        onTap: (i) => onItemPress(i),
        items: items
            .map(
              (item) => SalomonBottomBarItem(
                selectedColor: Colors.white,
                activeIcon: item.filledIcon.contains(".svg")
                    ? SvgPicture.asset(
                        item.filledIcon,
                        height: 22,
                        width: 22,
                      )
                    : SizedBox(
                        height: 22,
                        width: 22,
                        child: Image.asset(
                          item.filledIcon,
                        ),
                      ),
                icon: item.filledIcon.contains(".svg")
                    ? SvgPicture.asset(
                        item.icon,
                        height: 22,
                        width: 22,
                      )
                    : SizedBox(
                        height: 22,
                        width: 22,
                        child: Image.asset(
                          item.icon,
                        ),
                      ),
                title: Text(
                  item.name,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
