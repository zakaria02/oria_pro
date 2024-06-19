import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/client/moduls/account/feature/widgets/user_image.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/comment.dart';
import 'package:oria_pro/client/moduls/explore/feature/forum/cubit/comment_visibility_cubit.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({
    super.key,
    required this.comment,
    required this.onReply,
    this.isSub = false,
    required this.onMore,
    required this.onLike,
  });
  final Comment comment;
  final Function(Comment) onReply;
  final bool isSub;
  final Function(Comment) onMore;
  final Function(Comment) onLike;

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentVisibilityCubit, CommentVisibilityState>(
      builder: (context, state) {
        final isVisible = state.commentsVisibilities
            .firstWhere((comm) => comm.commentId == widget.comment.id,
                orElse: () => CommentWithVisibility(
                    commentId: widget.comment.id, commentVisibility: false))
            .commentVisibility;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserImage(
              userImage: widget.comment.user.profilePicture,
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
                    child: Row(
                      children: [
                        Text(
                          widget.comment.user.name,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => widget.onMore(widget.comment),
                          child: SvgPicture.asset(SvgAssets.moreIcon),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.comment.comment,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontFamily: "satoshi",
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget.onReply(widget.comment);
                          context
                              .read<CommentVisibilityCubit>()
                              .setVisible(widget.comment);
                        },
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
                      if (!widget.isSub) ...[
                        Text(
                          widget.comment.subComments.length.toString(),
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "satoshi",
                                  ),
                        ),
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CommentVisibilityCubit>()
                                .changeVisible(widget.comment);
                          },
                          child: SvgPicture.asset(
                            SvgAssets.commentIcon,
                          ),
                        ),
                        const SizedBox(width: 6),
                      ],
                      Text(
                        widget.comment.likeCount.toString(),
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "satoshi",
                                ),
                      ),
                      const SizedBox(width: 6),
                      InkWell(
                        onTap: () => widget.onLike(widget.comment),
                        child: SvgPicture.asset(
                          widget.comment.isLiked
                              ? SvgAssets.heartFilledIcon
                              : SvgAssets.heartIcon,
                        ),
                      ),
                    ],
                  ),
                  if (isVisible) ...[
                    const SizedBox(height: 20),
                    ...widget.comment.subComments.map(
                      (comm) => CommentCard(
                        comment: comm,
                        onReply: (subComment) => widget.onReply(widget.comment),
                        isSub: true,
                        onMore: (subComment) => widget.onMore(subComment),
                        onLike: (subComment) => widget.onLike(subComment),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
