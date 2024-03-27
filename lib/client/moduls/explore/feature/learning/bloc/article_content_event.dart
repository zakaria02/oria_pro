part of 'article_content_bloc.dart';

sealed class ArticleContentEvent extends Equatable {
  const ArticleContentEvent();

  @override
  List<Object> get props => [];
}

final class FetchArticleContent extends ArticleContentEvent {
  final String articleId;
  const FetchArticleContent({required this.articleId});
}

final class UpdateFavorite extends ArticleContentEvent {}
