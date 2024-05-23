import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/learning_content.dart';
import 'package:oria_pro/client/moduls/explore/feature/learning/bloc/article_content_bloc.dart';
import 'package:oria_pro/client/moduls/explore/feature/widget/content_view.dart';
import 'package:oria_pro/common/symptoms/feature/entity/symptom.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:oria_pro/widgets/oria_snack_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../client/moduls/explore/feature/learning/pages/article_page.dart';
import '../../../../client/moduls/explore/feature/programs/bloc/programs_bloc.dart';
import '../../../../client/moduls/explore/feature/programs/pages/program_details_page.dart';
import '../bloc/symptom_bloc.dart';

@RoutePage()
class SymptomDataPage extends StatelessWidget {
  const SymptomDataPage({super.key, required this.symptom});

  final Symptom symptom;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SymptomBloc()..add(GetSymptomData(symptom: symptom)),
        ),
        BlocProvider(
          create: (context) => ProgramsBloc(),
        ),
        BlocProvider(
          create: (context) => ArticleContentBloc(),
        )
      ],
      child: OriaScaffold(
        appBarData: AppBarData(
          firstButtonUrl: SvgAssets.backAsset,
          onFirstButtonPress: () => context.maybePop(),
          title: symptom.name,
        ),
        body: BlocConsumer<SymptomBloc, SymptomState>(
          listener: (context, state) {
            if (state is SymptomError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(OriaErrorSnackBar(content: state.errorMessage));
            }
          },
          builder: (context, state) {
            if (state is SymptomDataLoading) {
              return const OriaLoadingProgress();
            }
            return Expanded(
              child: ListView(
                children: [
                  if (state.symptomPrograms.isNotEmpty) ...[
                    Text(
                      AppLocalizations.of(context)!.programsForSymptom(
                        symptom.name,
                      ),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 198,
                      child: BlocBuilder<ProgramsBloc, ProgramsState>(
                        builder: (programContext, programState) {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => ArticleCard(
                              program: state.symptomPrograms[index],
                              onItemPeress: (id, name) {
                                BlocProvider.of<ProgramsBloc>(programContext)
                                    .add(
                                  FetchProgramDetails(
                                    programId: id,
                                  ),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return BlocProvider.value(
                                          value: BlocProvider.of<ProgramsBloc>(
                                            programContext,
                                          ),
                                          child: const ProgramDetailsPage());
                                    },
                                  ),
                                );
                              },
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 8),
                            itemCount: state.symptomPrograms.length,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  if (state.symptomArticles.isNotEmpty) ...[
                    Text(
                      AppLocalizations.of(context)!.articlesForSymptom(
                        symptom.name,
                      ),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 198,
                      child:
                          BlocBuilder<ArticleContentBloc, ArticleContentState>(
                        builder: (articleContext, articleState) {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => ArticleCard(
                              article: state.symptomArticles[index],
                              type: LearningContentType.article,
                              onItemPeress: (id, name) {
                                BlocProvider.of<ArticleContentBloc>(
                                        articleContext)
                                    .add(FetchArticleContent(articleId: id));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return BlocProvider.value(
                                          value: BlocProvider.of<
                                              ArticleContentBloc>(
                                            articleContext,
                                          ),
                                          child: ArticlePage(id: id));
                                    },
                                  ),
                                );
                              },
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 8),
                            itemCount: state.symptomArticles.length,
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
