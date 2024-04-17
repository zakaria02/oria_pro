import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_no_data_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../common/entity/author.dart';
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
              firstButtonUrl: SvgAssets.backAsset,
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
                            if (state.selectedSection!.imageUrl != null)
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
                            if (state.selectedSection!.videoUrl != null)
                              const SizedBox(height: 8),
                            if (state.selectedSection!.videoUrl != null)
                              OriaVideoPlayer(
                                  videoUrl: state.selectedSection!.videoUrl!),
                            const SizedBox(height: 8),
                            SizedBox(
                                height: state.selectedSection!.imageUrl != null
                                    ? 8
                                    : 0),
                            OriaCard(
                              child: HtmlWidget(
                                state.selectedSection!.content,
                              ),
                            ),
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
