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
    this.onlyTopRaduis = false,
    this.onlyBottomRaduis = false,
    this.noRaduis = false,
    this.radius = 12,
    this.boxShadow,
  });
  final Widget child;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final EdgeInsets padding;
  final bool onlyTopRaduis;
  final bool onlyBottomRaduis;
  final bool noRaduis;
  final double radius;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: noRaduis
            ? null
            : onlyTopRaduis
                ? BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radius),
                  )
                : onlyBottomRaduis
                    ? BorderRadius.only(
                        bottomLeft: Radius.circular(radius),
                        bottomRight: Radius.circular(radius),
                      )
                    : BorderRadius.circular(radius),
        color: backgroundColor,
        border: borderColor != null ? Border.all(color: borderColor!) : null,
        boxShadow: boxShadow,
      ),
      padding: padding,
      margin: EdgeInsets.zero,
      child: child,
    );
  }
}
