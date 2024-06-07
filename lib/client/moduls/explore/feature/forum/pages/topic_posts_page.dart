import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/forum_topic.dart';
import 'package:oria_pro/client/moduls/explore/feature/forum/cubit/post_filter_dart_cubit.dart';
import 'package:oria_pro/client/moduls/explore/feature/forum/pages/add_topic_post_page.dart';
import 'package:oria_pro/client/moduls/explore/feature/forum/pages/post_details_page.dart';
import 'package:oria_pro/client/moduls/explore/feature/forum/widgets/post_card.dart';
import 'package:oria_pro/client/moduls/explore/feature/forum/widgets/post_filter.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/widgets/oria_snack_bar.dart';

import '../bloc/forum_bloc.dart';

class TopicPostsPage extends StatelessWidget {
  const TopicPostsPage({super.key, required this.topic});
  final ForumTopic topic;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostFilterCubit([]),
      child: BlocBuilder<PostFilterCubit, PostFilterState>(
        builder: (context, filterState) {
          return BlocConsumer<ForumBloc, ForumState>(
            listener: (context, state) {
              if (state is ForumError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  OriaErrorSnackBar(
                    content: state.errorMessage,
                  ),
                );
              }
              if (state is TopicPostsSuccess) {
                BlocProvider.of<PostFilterCubit>(context).addFilter(
                  FilterType.mostRecent,
                  state.posts,
                );
              }
            },
            builder: (blocContext, state) {
              return OriaScaffold(
                appBarData: AppBarData(
                  firstButtonUrl: SvgAssets.backAsset,
                  onFirstButtonPress: () => context.maybePop(),
                  title: topic.title,
                  lastButtonUrl: SvgAssets.addIcon,
                  onLastButtonPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BlocProvider.value(
                              value: BlocProvider.of<ForumBloc>(
                                blocContext,
                              ),
                              child: AddTopicPostPage(topic: topic));
                        },
                      ),
                    );
                  },
                ),
                body: state is TopicPostsLoading
                    ? const OriaLoadingProgress()
                    : Expanded(
                        child: Column(
                          children: [
                            if (state is DeletePostLoading)
                              const Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: OriaLoadingProgress(),
                              ),
                            Row(
                              children: [
                                PostFilter(
                                  title: AppLocalizations.of(context)!.my,
                                  onPress: () {
                                    BlocProvider.of<PostFilterCubit>(context)
                                        .addFilter(
                                      FilterType.my,
                                      state.posts,
                                    );
                                  },
                                  selected: filterState.filter == FilterType.my,
                                ),
                                const SizedBox(width: 8),
                                PostFilter(
                                  title: AppLocalizations.of(context)!.top,
                                  onPress: () {
                                    BlocProvider.of<PostFilterCubit>(context)
                                        .addFilter(
                                      FilterType.top,
                                      state.posts,
                                    );
                                  },
                                  selected:
                                      filterState.filter == FilterType.top,
                                ),
                                const SizedBox(width: 8),
                                PostFilter(
                                  title:
                                      AppLocalizations.of(context)!.mostRecent,
                                  onPress: () {
                                    BlocProvider.of<PostFilterCubit>(context)
                                        .addFilter(
                                      FilterType.mostRecent,
                                      state.posts,
                                    );
                                  },
                                  selected: filterState.filter ==
                                      FilterType.mostRecent,
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Expanded(
                              child: ListView.separated(
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<ForumBloc>(context).add(
                                        FetchPostDetails(
                                            post: filterState.posts[index]));
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return BlocProvider.value(
                                            value: BlocProvider.of<ForumBloc>(
                                              blocContext,
                                            ),
                                            child: PostDetailsPage(
                                              topic: topic,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: PostCard(
                                    post: filterState.posts[index],
                                    onDelete: () {
                                      BlocProvider.of<ForumBloc>(context).add(
                                        DeletePost(
                                          topic: topic,
                                          post: filterState.posts[index],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 12),
                                itemCount: filterState.posts.length,
                              ),
                            )
                          ],
                        ),
                      ),
              );
            },
          );
        },
      ),
    );
  }
}
