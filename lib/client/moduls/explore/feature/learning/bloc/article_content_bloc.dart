import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/explore/business/model/learning_article.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/learning_article.dart';

import '../../../business/di/explore_locator.dart';
import '../../../business/repository/explore_repository.dart';
import '../use_case/update_article_favorite_use_case.dart';

part 'article_content_event.dart';
part 'article_content_state.dart';

class ArticleContentBloc
    extends Bloc<ArticleContentEvent, ArticleContentState> {
  ArticleContentBloc() : super(const ArticleContentInitial()) {
    on<FetchArticleContent>((event, emit) async {
      emit(
        const ArticleContentLoading(
          article: null,
        ),
      );
      ExploreRepository learningRepository = ExploreLocator().get();
      try {
        LearningArticleModel articleDto =
            await learningRepository.fetchArticleContent(event.articleId);

        emit(
          ArticleContentSuccess(
            article: articleDto.toArticleWithContentUio(),
          ),
        );
      } catch (e) {
        emit(ArticleContentError(
          errorMessage: e.toString(),
          article: state.article,
        ));
      }
    });

    on<UpdateFavorite>((event, emit) async {
      UpdateArticleFavoriteUseCase usecase = ExploreLocator().get();
      try {
        final article = await usecase.execute(state.article!);
        emit(
          ArticleFavoriteSuccess(
            article: article,
          ),
        );
      } catch (e) {
        emit(ArticleContentError(
          errorMessage: e.toString(),
          article: state.article,
        ));
      }
    });
  }
}
