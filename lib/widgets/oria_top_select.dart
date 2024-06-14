import 'package:flutter/material.dart';

import '../utils/constants/oria_colors.dart';

class OriaTopBarSelect extends StatelessWidget {
  const OriaTopBarSelect({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onItemPress,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
    this.margin = const EdgeInsets.symmetric(vertical: 5),
    this.fontSize,
  });

  final List<String> items;
  final String selectedItem;
  final Function(String) onItemPress;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double? fontSize;

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
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items
              .map((item) => Expanded(
                    child: GestureDetector(
                      onTap: () => onItemPress(item),
                      child: Container(
                        padding: margin,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: selectedItem == item
                              ? OriaColors.green
                              : Colors.white,
                        ),
                        child: Text(
                          item,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  fontWeight: selectedItem == item
                                      ? FontWeight.w700
                                      : FontWeight.w500,
                                  color: selectedItem == item
                                      ? Colors.white
                                      : OriaColors.green,
                                  fontSize: fontSize),
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
