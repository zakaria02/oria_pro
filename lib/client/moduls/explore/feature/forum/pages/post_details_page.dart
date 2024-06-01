import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oria_pro/client/moduls/account/feature/widgets/user_image.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/extensions/date_extensions.dart';
import 'package:oria_pro/widgets/oria_icon_button.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_rounded_input.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../utils/constants/svg_assets.dart';
import '../../../../../../widgets/oria_app_bar.dart';
import '../../../../../../widgets/oria_snack_bar.dart';
import '../../entity/forum_topic.dart';
import '../bloc/forum_bloc.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({super.key, required this.topic});
  final ForumTopic topic;

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
      },
      builder: (blocContext, state) {
        return OriaScaffold(
          backgroundColor: Colors.white,
          appBarData: AppBarData(
            firstButtonUrl: SvgAssets.backAsset,
            onFirstButtonPress: () => context.maybePop(),
            title: topic.title,
            lastButtonUrl: SvgAssets.moreIcon,
            onLastButtonPress: () {},
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
                                  userImage: state.post!.user.profilePicture,
                                  size: 48,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  state.post!.user.name,
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                )
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              state.post!.title,
                              style: Theme.of(context).textTheme.displayLarge,
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
                                  state.post!.commentCount.toString(),
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
                          ]
                        : [],
                  ),
                ),
          bottomBarPadding:
              const EdgeInsets.only(bottom: 10, left: 20, right: 20),
          bottomNavigationBar: state.post != null
              ? Row(
                  children: [
                    Expanded(
                      child: OriaRoundedInput(
                        hintText: AppLocalizations.of(context)!.replyTo(
                          state.post!.user.name.split(" ").first,
                        ),
                        onTextChange: (value) {},
                        borderColor: OriaColors.disabledColor,
                        filled: false,
                      ),
                    ),
                    const SizedBox(width: 8),
                    OriaIconButton(
                      url: SvgAssets.sendIcon,
                      onPress: () {},
                    ),
                  ],
                )
              : null,
        );
      },
    );
  }
}
