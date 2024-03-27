import 'package:flutter/material.dart';

import '../utils/constants/oria_colors.dart';

class OriaLoadingProgress extends StatelessWidget {
  const OriaLoadingProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const LinearProgressIndicator(
      color: OriaColors.green,
      backgroundColor: Colors.white,
    );
  }
}
