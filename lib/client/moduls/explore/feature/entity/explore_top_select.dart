import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExploreTopSelect {
  static String programs(BuildContext context) =>
      AppLocalizations.of(context)!.programs;
  static String learning(BuildContext context) =>
      AppLocalizations.of(context)!.learning;
  static String forum(BuildContext context) =>
      AppLocalizations.of(context)!.forum;

  static List<String> items(BuildContext context) =>
      [programs(context), learning(context), forum(context)];
}
