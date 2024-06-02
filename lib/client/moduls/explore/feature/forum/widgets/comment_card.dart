import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/client/moduls/account/feature/widgets/user_image.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/comment.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.comment});
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserImage(
          userImage: comment.user.profilePicture,
          size: 48,
          hasBorder: false,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Text(
                  comment.user.name,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                comment.comment,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontFamily: "satoshi",
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          SvgAssets.replyIcon,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          AppLocalizations.of(context)!.reply,
                          style: Theme.of(context).textTheme.labelMedium,
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    comment.likeCount.toString(),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontFamily: "satoshi",
                        ),
                  ),
                  const SizedBox(width: 6),
                  SvgPicture.asset(
                    SvgAssets.heartIcon,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
