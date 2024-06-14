import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oria_pro/client/moduls/account/feature/widgets/user_image.dart';
import 'package:oria_pro/client/moduls/explore/feature/forum/cubit/comment_visibility_cubit.dart';
import 'package:oria_pro/client/moduls/explore/feature/forum/widgets/comment_card.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/extensions/date_extensions.dart';
import 'package:oria_pro/widgets/oria_icon_button.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../utils/constants/svg_assets.dart';
import '../../../../../../widgets/oria_app_bar.dart';
import '../../../../../../widgets/oria_snack_bar.dart';
import '../../entity/comment.dart';
import '../../entity/forum_topic.dart';
import '../bloc/forum_bloc.dart';
import '../widgets/post_menu.dart';
import 'add_topic_post_page.dart';

class PostDetailsPage extends StatefulWidget {
  const PostDetailsPage({super.key, required this.topic});
  final ForumTopic topic;

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  bool showMenu = false;
  bool showCommentMenu = false;
  TextEditingController commentController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Comment? _selectedComment;
  Comment? menuComment;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus && commentController.text.isEmpty) {
      _selectedComment = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForumBloc, ForumState>(
      listener: (context, state) {
        if (state is ForumError) {
          ScaffoldMessenger.of(context).showSnackBar(
            OriaErrorSnackBar(
              content: state.errorMessage,
            ),
          );
        } else if (state is CommentSuccess) {
          setState(() {
            commentController.text = "";
            _selectedComment = null;
            menuComment = null;
            _focusNode.unfocus();
          });
        } else if (state is DeletePostSuccess) {
          context.maybePop();
        } else if (state is FavoriteSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            OriaSuccessSnackBar(
              content: state.post?.isFavourite == true
                  ? AppLocalizations.of(context)!.addedToFavorite
                  : AppLocalizations.of(context)!.removeFromFavorite,
            ),
          );
        }
      },
      builder: (blocContext, state) {
        return BlocProvider(
          create: (context) => CommentVisibilityCubit(state.comments
              .map(
                (comm) => CommentWithVisibility(
                    commentId: comm.id, commentVisibility: false),
              )
              .toList()),
          child: PopScope(
            onPopInvoked: (didPop) {
              setState(() {
                showMenu = false;
                showCommentMenu = false;
              });
            },
            canPop: !showMenu,
            child: Stack(
              children: [
                OriaScaffold(
                  backgroundColor: Colors.white,
                  appBarData: AppBarData(
                    firstButtonUrl: SvgAssets.backAsset,
                    onFirstButtonPress: () => context.maybePop(),
                    title: widget.topic.title,
                    lastButtonUrl: state is! TopicPostDetailsLoading
                        ? SvgAssets.moreIcon
                        : null,
                    onLastButtonPress: () {
                      setState(() {
                        showMenu = true;
                      });
                    },
                  ),
                  body: state is TopicPostDetailsLoading
                      ? const OriaLoadingProgress()
                      : Expanded(
                          child: ListView(
                            children: state.post != null
                                ? [
                                    if ((state is DeletePostLoading) ||
                                        (state is FavoriteLoading) ||
                                        (state is CommentLoading))
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: OriaLoadingProgress(),
                                      ),
                                    Row(
                                      children: [
                                        UserImage(
                                          userImage:
                                              state.post!.user.profilePicture,
                                          size: 48,
                                          hasBorder: false,
                                        ),
                                        const SizedBox(width: 12),
                                        Text(
                                          state.post!.user.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      state.post!.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      state.post!.content,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                            fontFamily: "satoshi",
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    const SizedBox(height: 24),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            BlocProvider.of<ForumBloc>(
                                                    blocContext)
                                                .add(
                                              LikePost(
                                                post: state.post!,
                                                topic: widget.topic,
                                              ),
                                            );
                                          },
                                          child: SvgPicture.asset(
                                            state.post!.isLiked
                                                ? SvgAssets.heartFilledIcon
                                                : SvgAssets.heartIcon,
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          state.post!.likeCount.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(
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
                                          Comment.getTotalCommentsForList(
                                                  state.comments)
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "satoshi",
                                              ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "${AppLocalizations.of(context)!.posted}${state.post!.createdAt.toTimeDifferenceInUnits(context)}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "satoshi",
                                              ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    const Divider(
                                        color: OriaColors.iconButtonBackgound),
                                    const SizedBox(height: 16),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          CommentCard(
                                        comment: state.comments[index],
                                        onReply: (comment) {
                                          _selectedComment = comment;
                                          _focusNode.requestFocus();
                                        },
                                        onMore: (comment) {
                                          setState(() {
                                            showCommentMenu = true;
                                            menuComment = comment;
                                          });
                                        },
                                      ),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(height: 20),
                                      itemCount: state.comments.length,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                    ),
                                    const SizedBox(height: 20),
                                  ]
                                : [],
                          ),
                        ),
                  bottomNavigationBar: state.post != null
                      ? Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                focusNode: _focusNode,
                                controller: commentController,
                                decoration: InputDecoration(
                                  hintText:
                                      AppLocalizations.of(context)!.replyTo(
                                    state.post!.user.name.split(" ").first,
                                  ),
                                  hintStyle: TextStyle(
                                    color: Theme.of(context).disabledColor,
                                    fontFamily: "Raleway",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 20,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32),
                                    borderSide: const BorderSide(
                                      color: OriaColors.disabledColor,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32),
                                    borderSide: const BorderSide(
                                      color: OriaColors.green,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            OriaIconButton(
                              url: SvgAssets.sendIcon,
                              onPress: (state.post != null &&
                                      state is CommentLoading &&
                                      commentController.text.isNotEmpty)
                                  ? null
                                  : () {
                                      if (menuComment != null) {
                                        BlocProvider.of<ForumBloc>(blocContext)
                                            .add(
                                          UpdateComment(
                                            currentComment: menuComment!,
                                            comment: commentController.text,
                                          ),
                                        );
                                      } else {
                                        BlocProvider.of<ForumBloc>(blocContext)
                                            .add(
                                          AddComment(
                                            topic: widget.topic,
                                            post: state.post!,
                                            comment: commentController.text,
                                            parentId: _selectedComment?.id,
                                          ),
                                        );
                                      }
                                    },
                            ),
                          ],
                        )
                      : null,
                ),
                if (showMenu)
                  PostMenu(
                    onClose: () => setState(() {
                      showMenu = false;
                    }),
                    onSubscription: () =>
                        BlocProvider.of<ForumBloc>(blocContext).add(
                      FavoritePost(post: state.post!),
                    ),
                    onCompalin: () {},
                    onDelete: () {
                      BlocProvider.of<ForumBloc>(blocContext).add(
                        DeletePost(
                          topic: widget.topic,
                          post: state.post!,
                        ),
                      );
                    },
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return BlocProvider.value(
                              value: BlocProvider.of<ForumBloc>(
                                blocContext,
                              ),
                              child: AddTopicPostPage(
                                topic: widget.topic,
                                editablePost: state.post,
                              ),
                            );
                          },
                        ),
                      );
                    },
                    isOwner: state.post?.isOwner == true,
                    isFavorite: state.post?.isFavourite == true,
                  ),
                if (showCommentMenu)
                  PostMenu(
                    onClose: () => setState(() {
                      showCommentMenu = false;
                    }),
                    onCompalin: () {},
                    onDelete: () {
                      if (menuComment != null) {
                        BlocProvider.of<ForumBloc>(blocContext).add(
                          DeleteComment(
                            comment: menuComment!,
                          ),
                        );
                        menuComment = null;
                      }
                    },
                    onEdit: () {
                      setState(() {
                        commentController.text = menuComment?.comment ?? "";
                        _focusNode.requestFocus();
                      });
                    },
                    isOwner: menuComment?.isOwner == true,
                    center: true,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
