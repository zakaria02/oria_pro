import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/client/moduls/explore/feature/forum/bloc/forum_bloc.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/utils/router/router.dart';
import 'package:oria_pro/widgets/oria_card.dart';

import '../../../expert/feature/bloc/expert_bloc.dart';
import '../../../expert/feature/pages/experts/pages/expert_details_page.dart';
import '../../../explore/feature/forum/pages/post_details_page.dart';
import '../../../explore/feature/programs/bloc/programs_bloc.dart';
import '../../../explore/feature/programs/pages/program_details_page.dart';
import '../entity/favourite.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({
    super.key,
    required this.favourite,
    required this.onRemove,
    required this.refresh,
  });

  final Favourite favourite;
  final Function(Favourite) onRemove;
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ExpertBloc(),
        ),
        BlocProvider(
          create: (context) => ProgramsBloc(),
        ),
        BlocProvider(
          create: (context) => ForumBloc(),
        ),
      ],
      child: BlocBuilder<ForumBloc, ForumState>(
        builder: (forumContext, state) {
          return BlocBuilder<ProgramsBloc, ProgramsState>(
            builder: (programContext, state) {
              return BlocBuilder<ExpertBloc, ExpertState>(
                builder: (expertContext, state) {
                  return GestureDetector(
                    onTap: () {
                      if (favourite.resourceType == "expert") {
                        BlocProvider.of<ExpertBloc>(expertContext)
                            .add(FetchMedicalInfo());
                        BlocProvider.of<ExpertBloc>(expertContext)
                            .add(FetchExpert(expertId: favourite.resourceId));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (currentContext) {
                              return BlocProvider.value(
                                value: BlocProvider.of<ExpertBloc>(
                                  expertContext,
                                ),
                                child: const ExpertDetailsPage(),
                              );
                            },
                          ),
                        ).then((val) {
                          refresh();
                        });
                      } else if (favourite.resourceType == "article") {
                        context.router
                            .push(ArticleRoute(id: favourite.resourceId))
                            .then((val) {
                          refresh();
                        });
                      } else if (favourite.resourceType == "program") {
                        BlocProvider.of<ProgramsBloc>(programContext).add(
                          FetchProgramDetails(
                            programId: favourite.resourceId,
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return BlocProvider.value(
                                  value: BlocProvider.of<ProgramsBloc>(
                                    programContext,
                                  ),
                                  child: const ProgramDetailsPage());
                            },
                          ),
                        ).then((val) {
                          refresh();
                        });
                      } else if (favourite.resourceType == "post") {
                        BlocProvider.of<ForumBloc>(forumContext).add(
                            FetchPostDetails(postId: favourite.resourceId));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return BlocProvider.value(
                                value: BlocProvider.of<ForumBloc>(
                                  forumContext,
                                ),
                                child: PostDetailsPage(
                                  postId: favourite.resourceId,
                                ),
                              );
                            },
                          ),
                        ).then((val) {
                          refresh();
                        });
                      }
                    },
                    child: OriaCard(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              favourite.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(width: 12),
                          InkWell(
                            onTap: () => onRemove(favourite),
                            child: SvgPicture.asset(SvgAssets.heartFilledIcon),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
