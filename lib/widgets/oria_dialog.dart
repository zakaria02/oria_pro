import 'package:flutter/material.dart';

class OriaDialog extends StatelessWidget {
  const OriaDialog({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(10),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(10),
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      content: Padding(
        padding: padding,
        child: Container(child: child),
      ),
    );
  }
}
