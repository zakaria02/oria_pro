import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../common/symptoms/feature/bloc/symptom_bloc.dart';
import '../../../../../common/symptoms/feature/pages/update_todays_action_page.dart';

class NoTodaysActions extends StatelessWidget {
  const NoTodaysActions({
    super.key,
    required this.refreshTodaysAction,
  });

  final VoidCallback refreshTodaysAction;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SymptomBloc(),
      child: BlocBuilder<SymptomBloc, SymptomState>(
        builder: (blocContext, state) {
          return OriaCard(
            padding: const EdgeInsets.all(18),
            backgroundColor: OriaColors.iconButtonBackgound,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            "!",
                            style: TextStyle(
                              fontFamily: "satoshi",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  AppLocalizations.of(context)!.noActiveProgram,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: const Color(0xFF3F3B3B),
                      ),
                ),
                Text(
                  AppLocalizations.of(context)!.enrollTodaysActionsProgram,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF3F3B3B),
                      ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<SymptomBloc>(blocContext)
                        .add(const FetchTodaysActionPrograms());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BlocProvider.value(
                            value: BlocProvider.of<SymptomBloc>(
                              blocContext,
                            ),
                            child: UpdateTodaysActionsProgramPage(
                              refresh: refreshTodaysAction,
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 26,
                    width: 132,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.enrollInProgram,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF3F3B3B),
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
