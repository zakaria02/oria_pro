import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/constants/svg_assets.dart';

class OriaNoDataView extends StatelessWidget {
  const OriaNoDataView({super.key, required this.message, this.height = 500});

  final String message;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              SvgAssets.noDataAsset,
              height: height,
            ),
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
