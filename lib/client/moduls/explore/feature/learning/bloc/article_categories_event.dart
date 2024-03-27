part of 'article_categories_bloc.dart';

sealed class ArticleCategoriesEvent extends Equatable {
  const ArticleCategoriesEvent();

  @override
  List<Object> get props => [];
}

final class FetchLearningCategories extends ArticleCategoriesEvent {}
