import 'package:flutter/material.dart';

import '../../../../../utils/constants/oria_colors.dart';
import '../../../../../utils/constants/png_assets.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
    required this.userImage,
    required this.size,
  });

  final String? userImage;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: userImage == null
              ? const AssetImage(
                  PngAssets.womanAsset,
                )
              // ignore: unnecessary_cast
              : (NetworkImage(userImage!) as ImageProvider<Object>),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
        border: Border.all(
          color: OriaColors.scaffoldBackgroundColor,
          width: 3,
        ),
      ),
    );
  }
}