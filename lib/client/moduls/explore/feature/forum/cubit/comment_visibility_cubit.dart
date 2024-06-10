import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/comment.dart';

part 'comment_visibility_state.dart';

class CommentVisibilityCubit extends Cubit<CommentVisibilityState> {
  CommentVisibilityCubit(List<CommentWithVisibility> commentsVisibilities)
      : super(
          CommentVisibilityState(
            commentsVisibilities: commentsVisibilities,
          ),
        );

  void setVisible(Comment comment) {
    final visibilities =
        List<CommentWithVisibility>.from(state.commentsVisibilities);
    final index = visibilities
        .indexWhere((visibility) => visibility.commentId == comment.id);
    if (index != -1) {
      visibilities[index] =
          CommentWithVisibility(commentId: comment.id, commentVisibility: true);
    } else {
      visibilities.add(CommentWithVisibility(
          commentId: comment.id, commentVisibility: true));
    }
    emit(CommentVisibilityState(commentsVisibilities: visibilities));
  }

  void changeVisible(Comment comment) {
    final visibilities =
        List<CommentWithVisibility>.from(state.commentsVisibilities);
    final index = visibilities
        .indexWhere((visibility) => visibility.commentId == comment.id);
    if (index != -1) {
      final currentVisibility = visibilities[index].commentVisibility;
      visibilities[index] = CommentWithVisibility(
          commentId: comment.id, commentVisibility: !currentVisibility);
    } else {
      visibilities.add(CommentWithVisibility(
          commentId: comment.id, commentVisibility: true));
    }
    emit(CommentVisibilityState(commentsVisibilities: visibilities));
  }

  void addCommentVisibility(Comment comment) {
    final visibilities =
        List<CommentWithVisibility>.from(state.commentsVisibilities);
    if (!visibilities.any((visibility) => visibility.commentId == comment.id)) {
      visibilities.add(CommentWithVisibility(
          commentId: comment.id, commentVisibility: false));
      emit(CommentVisibilityState(commentsVisibilities: visibilities));
    }
  }
}
