import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:oria_pro/client/moduls/explore/feature/learning/bloc/article_content_bloc.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/widgets/oria_expanded_tile.dart';
import 'package:oria_pro/widgets/oria_icon_button.dart';
import 'package:oria_pro/widgets/oria_snack_bar.dart';

import '../../../../../../common/widgets/author_card.dart';
import '../../../../../../utils/constants/svg_assets.dart';
import '../../../../../../widgets/oria_card.dart';
import '../../../../../../widgets/oria_loading_progress.dart';
import '../../../../../../widgets/oria_no_data_view.dart';

@RoutePage()
class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ArticleContentBloc()..add(FetchArticleContent(articleId: id)),
      child: Scaffold(
        body: BlocConsumer<ArticleContentBloc, ArticleContentState>(
          builder: (context, state) {
            if (state is ArticleContentLoading) {
              return const Padding(
                padding: EdgeInsets.only(top: 40),
                child: OriaLoadingProgress(),
              );
            }
            if (state.article == null) {
              return SizedBox(
                child: OriaNoDataView(
                  message: AppLocalizations.of(context)!.noArticleFound,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: OriaIconButton(
                      url: SvgAssets.backAsset,
                      onPress: () => context.maybePop(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        AspectRatio(
                          aspectRatio: 3 / 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              state.article!.imageurl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, top: 10),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              backgroundColor:
                                  OriaColors.scaffoldBackgroundColor,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 0.5),
                                child: OriaIconButton(
                                  url: state.article?.isFavorite == true
                                      ? SvgAssets.heartFilledIcon
                                      : SvgAssets.heartIcon,
                                  onPress: () =>
                                      BlocProvider.of<ArticleContentBloc>(
                                              context)
                                          .add(UpdateFavorite()),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  AuthorCard(author: state.article!.author),
                  const SizedBox(height: 8),
                  OriaCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.article!.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 20),
                        Html(
                          data: state.article!.htmlContent,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Visibility(
                    visible: state.article?.sources.isNotEmpty == true,
                    child: OriaExpandedTile(
                      title: AppLocalizations.of(context)!.sources,
                      children: state.article?.sources ?? [],
                    ),
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {
            if (state is ArticleContentError) {
              ScaffoldMessenger.of(context).showSnackBar(OriaErrorSnackBar(
                  content: AppLocalizations.of(context)!.error_default));
            }
            if (state is ArticleFavoriteSuccess) {
              String message;
              if (state.article?.isFavorite == true) {
                message = AppLocalizations.of(context)!.addedToFavorite;
              } else {
                message = AppLocalizations.of(context)!.removeFromFavorite;
              }
              ScaffoldMessenger.of(context)
                  .showSnackBar(OriaSuccessSnackBar(content: message));
            }
          },
        ),
      ),
    );
  }
}
