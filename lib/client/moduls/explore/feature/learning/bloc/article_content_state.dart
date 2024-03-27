part of 'article_content_bloc.dart';

sealed class ArticleContentState extends Equatable {
  const ArticleContentState({required this.article});
  final LearningArticle? article;

  @override
  List<Object?> get props => [article];
}

final class ArticleContentInitial extends ArticleContentState {
  const ArticleContentInitial() : super(article: null);
}

final class ArticleContentLoading extends ArticleContentState {
  const ArticleContentLoading({
    required super.article,
  });
}

final class ArticleContentSuccess extends ArticleContentState {
  const ArticleContentSuccess({
    required super.article,
  });
}

final class ArticleFavoriteSuccess extends ArticleContentState {
  const ArticleFavoriteSuccess({required super.article});
}

final class ArticleContentError extends ArticleContentState {
  final String errorMessage;
  const ArticleContentError({
    required this.errorMessage,
    required super.article,
  });
}
