import 'package:flutter/material.dart';

class OriaSnackBar extends SnackBar {
  OriaSnackBar({super.key, required String content, required Color color})
      : super(
          content: Text(content),
          backgroundColor: color,
        );
}

class OriaErrorSnackBar extends OriaSnackBar {
  OriaErrorSnackBar({super.key, required super.content})
      : super(color: Colors.redAccent);
}

class OriaSuccessSnackBar extends OriaSnackBar {
  OriaSuccessSnackBar({super.key, required super.content})
      : super(color: Colors.green[700]!);
}
