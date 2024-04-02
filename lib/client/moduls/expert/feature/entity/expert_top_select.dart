import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpertTopSelect {
  static String experts(BuildContext context) =>
      AppLocalizations.of(context)!.experts;
  static String appointments(BuildContext context) =>
      AppLocalizations.of(context)!.appointments;

  static List<String> items(BuildContext context) =>
      [experts(context), appointments(context)];
}

class ExpertTopSelectItem {
  final String title;
  final int? count;

  const ExpertTopSelectItem({required this.title, required this.count});
}
