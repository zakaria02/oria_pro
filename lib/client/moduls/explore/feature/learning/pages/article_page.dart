import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
                padding: EdgeInsets.only(top: 80),
                child: OriaLoadingProgress(),
              );
            }
            if (state.article == null) {
              return OriaNoDataView(
                  message: AppLocalizations.of(context)!.noArticleFound);
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: OriaIconButton(
                      url: SvgAssets.closeAsset,
                      onPress: () => context.maybePop(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    fit: StackFit.passthrough,
                    children: [
                      SizedBox(
                        height: 200,
                        child: AspectRatio(
                          aspectRatio: 3 / 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              state.article!.imageurl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 10),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            backgroundColor: OriaColors.scaffoldBackgroundColor,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.5),
                              child: OriaIconButton(
                                url: state.article?.isFavorite == true
                                    ? SvgAssets.favoriteAsset
                                    : SvgAssets.notFavoriteAsset,
                                size: 20,
                                onPress: () =>
                                    BlocProvider.of<ArticleContentBloc>(context)
                                        .add(UpdateFavorite()),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  AuthorCard(author: state.article!.author),
                  const SizedBox(height: 8),
                  OriaCard(
                    child: Column(
                      children: [
                        Text(
                          state.article!.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 20),
                        HtmlWidget(
                          state.article!.htmlContent,
                          textStyle: const TextStyle(
                            fontFamily: "Raleway",
                          ),
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
              ScaffoldMessenger.of(context)
                  .showSnackBar(OriaErrorSnackBar(content: state.errorMessage));
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
