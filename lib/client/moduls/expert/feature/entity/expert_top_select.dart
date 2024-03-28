import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpertTopSelect {
  static String experts(BuildContext context) =>
      AppLocalizations.of(context)!.expert;
  static String appointments(BuildContext context) =>
      AppLocalizations.of(context)!.appointments;
  static String history(BuildContext context) =>
      AppLocalizations.of(context)!.history;

  static List<String> items(BuildContext context) =>
      [experts(context), appointments(context), history(context)];
}
