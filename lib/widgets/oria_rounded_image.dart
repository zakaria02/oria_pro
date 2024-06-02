import 'package:flutter/material.dart';

class OriaRoundedImage extends StatelessWidget {
  const OriaRoundedImage({
    super.key,
    this.networkImage,
    this.assetImage,
    this.size = 48,
  }) : assert(networkImage != null || assetImage != null);
  final String? networkImage;
  final String? assetImage;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: networkImage != null
              ? NetworkImage(networkImage!)
              : AssetImage(assetImage!) as ImageProvider,
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
