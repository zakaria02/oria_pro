import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpertTopSelect {
  static String experts(BuildContext context) =>
      AppLocalizations.of(context)!.experts;
  static String appointments(BuildContext context) =>
      AppLocalizations.of(context)!.appointments;

  static List<String> items(BuildContext context) =>
      [experts(context), appointments(context)];

  static String upcoming(BuildContext context) =>
      AppLocalizations.of(context)!.upcoming;
  static String previous(BuildContext context) =>
      AppLocalizations.of(context)!.previous;

  static List<String> appointmentItems(BuildContext context) =>
      [upcoming(context), previous(context)];
}

class ExpertTopSelectItem {
  final String title;
  final int? count;

  const ExpertTopSelectItem({required this.title, required this.count});
}
