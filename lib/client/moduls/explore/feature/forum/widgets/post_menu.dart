import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oria_pro/client/moduls/explore/feature/forum/widgets/post_menu_item.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PostMenu extends StatelessWidget {
  const PostMenu({
    super.key,
    required this.onClose,
    this.onSubscription,
    required this.onCompalin,
    required this.onDelete,
    required this.onEdit,
    required this.isOwner,
    this.isFavorite = false,
    this.center = false,
    this.showAllItem = true,
  });
  final VoidCallback onClose;
  final VoidCallback? onSubscription;
  final VoidCallback onCompalin;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final bool isOwner;
  final bool isFavorite;
  final bool center;
  final bool showAllItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0x33000000),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 36),
            child: Column(
              mainAxisAlignment:
                  center ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                PostMenuItem(
                  icon: SvgAssets.closeAsset,
                  onPress: onClose,
                ),
                if (onSubscription != null) ...[
                  const SizedBox(height: 8),
                  PostMenuItem(
                    icon: SvgAssets.subscriptionAsset,
                    onPress: () {
                      onSubscription!();
                      onClose();
                    },
                    title: isFavorite
                        ? AppLocalizations.of(context)?.removeFromFavoite
                        : AppLocalizations.of(context)?.addToFavorite,
                  ),
                ],
                if (isOwner && showAllItem) ...[
                  const SizedBox(height: 8),
                  PostMenuItem(
                    icon: SvgAssets.deleteIcon,
                    onPress: () {
                      onDelete();
                      onClose();
                    },
                    title: AppLocalizations.of(context)?.delete,
                  ),
                  const SizedBox(height: 8),
                  PostMenuItem(
                    icon: SvgAssets.editAsset,
                    onPress: () {
                      onEdit();
                      onClose();
                    },
                    title: AppLocalizations.of(context)?.edit,
                  ),
                ],
                if (!isOwner) ...[
                  const SizedBox(height: 8),
                  PostMenuItem(
                    icon: SvgAssets.complainAsset,
                    onPress: () {
                      onCompalin();
                      onClose();
                    },
                    title: AppLocalizations.of(context)?.complain,
                    color: const Color(0xFFFF553E),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
