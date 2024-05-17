import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/tracker/feature/enitity/tracked_symptom.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/widgets/oria_snack_bar.dart';

import '../../../../../common/symptoms/feature/widgets/severity_card.dart';
import '../bloc/tracker_bloc.dart';

class LogSeverityPage extends StatefulWidget {
  const LogSeverityPage({
    super.key,
    required this.symptom,
  });
  final TrackedSymptom symptom;

  @override
  State<LogSeverityPage> createState() => _LogSeverityPageState();
}

class _LogSeverityPageState extends State<LogSeverityPage> {
  late int severity;
  Color get color => switch (severity) {
        0 => const Color(0xFFA8E4C2),
        1 => const Color(0xFFFEF3E0),
        2 => const Color(0xFFFFDAA5),
        3 => const Color(0xFFFF8888),
        4 => const Color(0xFFFF5858),
        _ => OriaColors.disabledColor,
      };

  Color get textColor => switch (severity) {
        0 => const Color(0xFF006400),
        1 => const Color(0xFF9F9F9F),
        _ => Colors.white,
      };

  @override
  void initState() {
    severity = widget.symptom.logEventValue ?? 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrackerBloc, TrackerState>(
      listener: (context, state) {
        if (state is AddSymptomSeveritySuccess) {
          context.maybePop();
        } else if (state is TrackedDataError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(OriaErrorSnackBar(content: state.errorMessage));
        }
      },
      builder: (context, state) {
        return OriaScaffold(
          appBarData: AppBarData(
            firstButtonUrl: SvgAssets.backAsset,
            onFirstButtonPress: () => context.maybePop(),
            title: AppLocalizations.of(context)!.logSymptomSeverity,
          ),
          body: Expanded(
            child: Column(
              children: [
                const SizedBox(height: 18),
                Expanded(
                  child: OriaCard(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.13),
                        blurRadius: 4,
                        offset: const Offset(0.0, 4),
                      ),
                    ],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          widget.symptom.icon,
                          height: 76,
                          color: OriaColors.green,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .howWasSymptomToday(widget.symptom.name),
                          style: const TextStyle(
                            color: OriaColors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Raleway",
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 64,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28, vertical: 5),
                          child: Text(
                            switch (severity) {
                              0 => AppLocalizations.of(context)!.great,
                              1 => AppLocalizations.of(context)!.good,
                              2 => AppLocalizations.of(context)!.okay,
                              3 => AppLocalizations.of(context)!.bad,
                              4 => AppLocalizations.of(context)!.awful,
                              _ => "",
                            },
                            style: TextStyle(
                              color: textColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Raleway",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Center(
                          child: SizedBox(
                            height: 70,
                            child: GridView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12,
                              ),
                              itemCount: 5,
                              itemBuilder: (context, index) => SeverityCard(
                                severity: index,
                                onPress: (s) => setState(() {
                                  severity = s;
                                }),
                                selected: index == severity,
                                color: OriaColors.scaffoldBackgroundColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
          bottomNavigationBar: Row(
            children: [
              Expanded(
                child: OriaRoundedButton(
                  onPress: () => context.maybePop(),
                  text: AppLocalizations.of(context)!.close,
                  primaryColor: OriaColors.scaffoldBackgroundColor,
                  borderColor: OriaColors.green,
                  textColor: OriaColors.green,
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: OriaRoundedButton(
                  onPress: () {
                    BlocProvider.of<TrackerBloc>(context).add(
                      AddSymptomSeverity(
                          symptomId: widget.symptom.symptomId,
                          severity: severity),
                    );
                  },
                  isLoading: state is AddSymptomSeverityLoading,
                  text: AppLocalizations.of(context)!.save,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
