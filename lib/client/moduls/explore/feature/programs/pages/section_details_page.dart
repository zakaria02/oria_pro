import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/entity/symptom_program.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_no_data_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../common/entity/author.dart';
import '../../../../../../common/widgets/author_card.dart';
import '../../../../../../widgets/oria_app_bar.dart';
import '../../../../../../widgets/oria_card.dart';
import '../../../../../../widgets/oria_loading_progress.dart';
import '../../../../../../widgets/oria_rounded_button.dart';
import '../../../../../../widgets/oria_scaffold.dart';
import '../../../../../../widgets/oria_video_player.dart';
import '../bloc/programs_bloc.dart';

@RoutePage()
class SectionDetailsPage extends StatelessWidget {
  const SectionDetailsPage({
    super.key,
    this.programName,
    required this.author,
  });
  final String? programName;
  final Author author;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramsBloc, ProgramsState>(
      builder: (context, state) {
        return OriaScaffold(
            appBarData: AppBarData(
              firstButtonUrl: SvgAssets.closeAsset,
              onFirstButtonPress: () => context.maybePop(),
              title: programName,
            ),
            body: state is UpdateSectionLoading
                ? const OriaLoadingProgress()
                : state is ProgramsError
                    ? OriaNoDataView(message: state.errorMessage)
                    : Expanded(
                        child: ListView(
                          children: [
                            const SizedBox(height: 16),
                            if (state.selectedSection!.type ==
                                SectionType.video)
                              AuthorCard(author: author),
                            SizedBox(
                                height: state.selectedSection!.type ==
                                        SectionType.article
                                    ? 8
                                    : 0),
                            if (state.selectedSection!.type ==
                                SectionType.article)
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      state.selectedSection!.imageUrl!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            SizedBox(
                                height: state.selectedSection!.type ==
                                        SectionType.article
                                    ? 8
                                    : 0),
                            if (state.selectedSection!.type ==
                                SectionType.article)
                              OriaCard(
                                child: HtmlWidget(
                                  state.selectedSection!.content,
                                ),
                              ),
                            SizedBox(
                                height: state.selectedSection!.type ==
                                        SectionType.video
                                    ? 40
                                    : 0),
                            if (state.selectedSection!.type ==
                                SectionType.video)
                              Text(
                                state.selectedSection!.title,
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            if (state.selectedSection!.type ==
                                SectionType.video)
                              const SizedBox(height: 24),
                            if (state.selectedSection!.type ==
                                SectionType.video)
                              OriaVideoPlayer(
                                  videoUrl: state.selectedSection!.content),
                          ],
                        ),
                      ),
            bottomNavigationBar: state.selectedSection != null
                ? OriaRoundedButton(
                    onPress: () => context.maybePop(true),
                    text: AppLocalizations.of(context)!.next,
                  )
                : null);
      },
    );
  }
}
