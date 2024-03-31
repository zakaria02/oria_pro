import 'package:flutter/material.dart';

import '../client/moduls/expert/feature/entity/expert_top_select.dart';
import '../utils/constants/oria_colors.dart';

class OriaTopBarSelect extends StatelessWidget {
  const OriaTopBarSelect({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onItemPress,
  });

  final List<ExpertTopSelectItem> items;
  final String selectedItem;
  final Function(ExpertTopSelectItem) onItemPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          50,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items
              .map((item) => Expanded(
                    child: GestureDetector(
                      onTap: () => onItemPress(item),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: selectedItem == item.title
                              ? OriaColors.green
                              : Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    fontWeight: selectedItem == item.title
                                        ? FontWeight.w700
                                        : FontWeight.w500,
                                    color: selectedItem == item.title
                                        ? Colors.white
                                        : OriaColors.green,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            if (item.count != null) ...[
                              const SizedBox(width: 12),
                              Container(
                                height: 22,
                                width: 22,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: selectedItem == item.title
                                      ? OriaColors.scaffoldBackgroundColor
                                      : OriaColors.iconButtonBackgound,
                                ),
                                child: Center(
                                  child: Text(
                                    "${item.count}",
                                    style: TextStyle(
                                      fontFamily: "satoshi",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: selectedItem == item.title
                                          ? OriaColors.green
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              )
                            ]
                          ],
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
