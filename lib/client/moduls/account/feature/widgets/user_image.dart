import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../utils/constants/oria_colors.dart';
import '../../../../../utils/constants/png_assets.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
    required this.userImage,
    required this.size,
    this.localImage,
    this.hasBorder = true,
  });

  final String? userImage;
  final File? localImage;
  final double size;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: localImage != null
              ? FileImage(localImage!)
              : userImage == null
                  ? const AssetImage(
                      PngAssets.womanAsset,
                    )
                  // ignore: unnecessary_cast
                  : (NetworkImage(userImage!) as ImageProvider<Object>),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
        border: hasBorder
            ? Border.all(
                color: OriaColors.scaffoldBackgroundColor,
                width: 3,
              )
            : null,
      ),
    );
  }
}
