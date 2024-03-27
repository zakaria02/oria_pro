import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/router/router.dart';
import '../../../../../widgets/oria_loading_progress.dart';
import '../widget/content_view.dart';
import 'bloc/article_categories_bloc.dart';

class LearningView extends StatelessWidget {
  const LearningView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleCategoriesBloc, ArticleCategoriesState>(
      builder: (context, learningState) {
        return learningState is ArticleCategoriesLoading
            ? const OriaLoadingProgress()
            : Expanded(
                child: ListView(shrinkWrap: true, children: [
                  ...learningState.content
                      .map(
                        (content) => ContentView(
                          content: content,
                          onItemPeress: (id, name) {
                            context.router.push(
                              ArticleRoute(id: id),
                            );
                          },
                        ),
                      )
                      .toList(),
                ]),
              );
      },
    );
  }
}
