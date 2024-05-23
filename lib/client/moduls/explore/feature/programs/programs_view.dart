import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/explore/feature/programs/pages/program_details_page.dart';

import '../../../../../widgets/oria_loading_progress.dart';
import '../widget/content_view.dart';
import 'bloc/programs_bloc.dart';

class ProgramsView extends StatelessWidget {
  const ProgramsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramsBloc, ProgramsState>(
      builder: (programBlocContext, programsState) {
        return programsState is ProgramsCategoryLoading
            ? const OriaLoadingProgress()
            : Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ...programsState.content
                        .map((content) => ContentView(
                              content: content,
                              onItemPeress: (id, name) {
                                BlocProvider.of<ProgramsBloc>(
                                        programBlocContext)
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
                                            programBlocContext,
                                          ),
                                          child: const ProgramDetailsPage());
                                    },
                                  ),
                                );
                              },
                            ),),
                  ],
                ),
              );
      },
    );
  }
}
