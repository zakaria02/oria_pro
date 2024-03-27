import 'package:flutter/material.dart';

class OriaCard extends StatelessWidget {
  const OriaCard({
    super.key,
    required this.child,
    this.borderColor,
    this.backgroundColor = Colors.white,
    this.width = double.infinity,
    this.height,
    this.padding = const EdgeInsets.all(20),
  });
  final Widget child;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      padding: padding,
      margin: EdgeInsets.zero,
      child: child,
    );
  }
}
