part of 'article_categories_bloc.dart';

sealed class ArticleCategoriesState extends Equatable {
  final List<LearningContent> content;

  const ArticleCategoriesState({required this.content});

  @override
  List<Object> get props => [content];
}

final class ArticleCategoriesInitial extends ArticleCategoriesState {
  const ArticleCategoriesInitial() : super(content: const []);
}

final class ArticleCategoriesLoading extends ArticleCategoriesState {
  const ArticleCategoriesLoading({
    required super.content,
  });
}

final class ArticleCategoriesSuccess extends ArticleCategoriesState {
  const ArticleCategoriesSuccess({
    required super.content,
  });
}

final class ArticleCategoriesError extends ArticleCategoriesState {
  final String errorMessage;
  const ArticleCategoriesError({
    required this.errorMessage,
    required super.content,
  });
}
