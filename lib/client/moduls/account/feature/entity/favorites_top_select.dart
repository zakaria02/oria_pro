import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritesTopSelect {
  static String experts(BuildContext context) =>
      AppLocalizations.of(context)!.experts;
  static String learn(BuildContext context) =>
      AppLocalizations.of(context)!.learn;
  static String programs(BuildContext context) =>
      AppLocalizations.of(context)!.programs;
  static String posts(BuildContext context) =>
      AppLocalizations.of(context)!.posts("");

  static List<String> items(BuildContext context) =>
      [experts(context), learn(context), programs(context), posts(context)];
}
