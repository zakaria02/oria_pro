import 'package:flutter/material.dart';

import '../utils/constants/oria_colors.dart';

class OriaTopBarSelect extends StatelessWidget {
  const OriaTopBarSelect(
      {super.key,
      required this.items,
      required this.selectedItem,
      required this.onItemPress});

  final List<String> items;
  final String selectedItem;
  final Function(String) onItemPress;

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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items
              .map((item) => Expanded(
                    child: GestureDetector(
                      onTap: () => onItemPress(item),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: selectedItem == item
                              ? OriaColors.green
                              : Colors.white,
                        ),
                        child: Text(
                          item,
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    fontWeight: selectedItem == item
                                        ? FontWeight.w700
                                        : FontWeight.w500,
                                    color: selectedItem == item
                                        ? Colors.white
                                        : OriaColors.green,
                                  ),
                          textAlign: TextAlign.center,
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
