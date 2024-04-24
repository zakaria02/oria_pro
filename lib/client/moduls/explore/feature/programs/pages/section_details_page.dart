import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/entity/symptom_program.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_no_data_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../widgets/oria_app_bar.dart';
import '../../../../../../widgets/oria_card.dart';
import '../../../../../../widgets/oria_loading_progress.dart';
import '../../../../../../widgets/oria_rounded_button.dart';
import '../../../../../../widgets/oria_scaffold.dart';
import '../../../../../../widgets/oria_video_player.dart';
import '../bloc/programs_bloc.dart';

@RoutePage()
class SectionDetailsPage extends StatefulWidget {
  const SectionDetailsPage({
    super.key,
    this.programName,
    this.section,
  });
  final String? programName;
  final ProgramSectionWithContent? section;

  @override
  State<SectionDetailsPage> createState() => _SectionDetailsPageState();
}

class _SectionDetailsPageState extends State<SectionDetailsPage> {
  bool displayNext = false;
  @override
  Widget build(BuildContext context) {
    return OriaScaffold(
        appBarData: AppBarData(
          firstButtonUrl: SvgAssets.backAsset,
          onFirstButtonPress: () => context.maybePop(),
          title: widget.programName,
        ),
        body: widget.section != null
            ? SectionBody(section: widget.section!)
            : BlocBuilder<ProgramsBloc, ProgramsState>(
                builder: (context, state) {
                  displayNext = state.selectedSection != null;
                  return state is UpdateSectionLoading
                      ? const OriaLoadingProgress()
                      : state is ProgramsError
                          ? OriaNoDataView(message: state.errorMessage)
                          : SectionBody(section: state.selectedSection!);
                },
              ),
        bottomNavigationBar: displayNext && widget.section == null
            ? OriaRoundedButton(
                onPress: () => context.maybePop(true),
                text: AppLocalizations.of(context)!.next,
              )
            : null);
  }
}

class SectionBody extends StatelessWidget {
  final ProgramSectionWithContent section;

  const SectionBody({super.key, required this.section});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          if (section.imageUrl != null)
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                    section.imageUrl!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          if (section.videoUrl != null) const SizedBox(height: 8),
          if (section.videoUrl != null)
            OriaVideoPlayer(videoUrl: section.videoUrl!),
          const SizedBox(height: 8),
          SizedBox(height: section.imageUrl != null ? 8 : 0),
          OriaCard(
            child: HtmlWidget(
              section.content,
            ),
          ),
        ],
      ),
    );
  }
}
