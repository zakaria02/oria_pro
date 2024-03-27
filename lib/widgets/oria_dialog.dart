import 'package:flutter/material.dart';

class OriaDialog extends StatelessWidget {
  const OriaDialog({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}
