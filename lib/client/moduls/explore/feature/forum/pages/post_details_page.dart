import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oria_pro/client/moduls/account/feature/widgets/user_image.dart';
import 'package:oria_pro/client/moduls/explore/feature/forum/widgets/comment_card.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/png_assets.dart';
import 'package:oria_pro/utils/extensions/date_extensions.dart';
import 'package:oria_pro/widgets/oria_dialog.dart';
import 'package:oria_pro/widgets/oria_icon_button.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../utils/constants/svg_assets.dart';
import '../../../../../../widgets/oria_app_bar.dart';
import '../../../../../../widgets/oria_snack_bar.dart';
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
  TextEditingController commentController = TextEditingController();

  void _showSubscriptionDialog() {
    showDialog(
      context: context,
      builder: (context) => OriaDialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              PngAssets.subscriptionAsset,
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.youHaveSubscribedTopic,
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.receiveTopicNotifs,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF9F9F9F),
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OriaRoundedButton(
                    onPress: () {
                      context.maybePop();
                    },
                    text: AppLocalizations.of(context)!.cancel,
                    borderColor: OriaColors.green,
                    primaryColor: Colors.white,
                    textColor: OriaColors.green,
                    height: 48,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OriaRoundedButton(
                    onPress: () {
                      context.maybePop();
                    },
                    text: AppLocalizations.of(context)!.okay,
                    height: 48,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
        }
        if (state is AddCommentSuccess) {
          setState(() {
            commentController.text = "";
          });
        }
      },
      builder: (blocContext, state) {
        return PopScope(
          onPopInvoked: (didPop) {
            setState(() {
              showMenu = false;
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
                                      SvgPicture.asset(
                                        SvgAssets.heartIcon,
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
                                        state.comments.length.toString(),
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
                                            comment: state.comments[index]),
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
                              controller: commentController,
                              decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)!.replyTo(
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
                                    state is AddCommentLoading &&
                                    commentController.text.isNotEmpty)
                                ? null
                                : () {
                                    BlocProvider.of<ForumBloc>(blocContext).add(
                                      AddComment(
                                        topic: widget.topic,
                                        post: state.post!,
                                        comment: commentController.text,
                                      ),
                                    );
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
                  onSubscription: _showSubscriptionDialog,
                  onCompalin: () {},
                  onDelete: () {},
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
                ),
            ],
          ),
        );
      },
    );
  }
}
