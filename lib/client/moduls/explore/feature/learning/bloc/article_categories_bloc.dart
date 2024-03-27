import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../business/di/explore_locator.dart';
import '../../entity/learning_content.dart';
import '../../use_case/fetch_learning_content_use_case.dart';

part 'article_categories_event.dart';
part 'article_categories_state.dart';

class ArticleCategoriesBloc
    extends Bloc<ArticleCategoriesEvent, ArticleCategoriesState> {
  ArticleCategoriesBloc() : super(const ArticleCategoriesInitial()) {
    on<FetchLearningCategories>((event, emit) async {
      FetchLearningContentUseCase learningContentUseCase =
          ExploreLocator().get();
      try {
        emit(ArticleCategoriesLoading(
          content: state.content,
        ));

        final result = await learningContentUseCase.execute(false);
        emit(
          ArticleCategoriesSuccess(
            content: result,
          ),
        );
      } catch (e) {
        emit(ArticleCategoriesError(
          content: state.content,
          errorMessage: e.toString(),
        ));
      }
    });
  }
}
