import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExploreTopSelect {
  static String programs(BuildContext context) =>
      AppLocalizations.of(context)!.programs;
  static String learn(BuildContext context) =>
      AppLocalizations.of(context)!.learn;
  static String liveQA(BuildContext context) =>
      AppLocalizations.of(context)!.liveqa;

  static List<String> items(BuildContext context) =>
      [programs(context), learn(context), liveQA(context)];

  static String forYou(BuildContext context) =>
      AppLocalizations.of(context)!.forYou;
  static String moreArticles(BuildContext context) =>
      AppLocalizations.of(context)!.moreArticles;

  static List<String> learnItems(BuildContext context) =>
      [forYou(context), moreArticles(context)];
}
