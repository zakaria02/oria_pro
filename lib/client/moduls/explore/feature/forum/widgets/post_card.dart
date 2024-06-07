import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/topic_post.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_card.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
    required this.onDelete,
  });

  final TopicPost post;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return OriaCard(
      width: null,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  post.title,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              if (post.isOwner) ...[
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: onDelete,
                  child: SvgPicture.asset(SvgAssets.deleteIcon),
                ),
              ]
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              SvgPicture.asset(
                SvgAssets.heartIcon,
              ),
              const SizedBox(width: 6),
              Text(
                post.likeCount.toString(),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontFamily: "satoshi",
                    ),
              ),
              const SizedBox(width: 16),
              SvgPicture.asset(
                SvgAssets.commentIcon,
              ),
              const SizedBox(width: 6),
              Text(
                post.commentCount.toString(),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontFamily: "satoshi",
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
