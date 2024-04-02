import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension DurationMappers on Duration {
  String toDayHourMinuteSecond(BuildContext context) {
    String day =
        inDays > 0 ? "${AppLocalizations.of(context)!.daysCount(inDays)} " : "";
    String hour = inHours > 0
        ? "${AppLocalizations.of(context)!.hours(inHours % 24)} "
        : "";
    String min = inMinutes > 0
        ? "${AppLocalizations.of(context)!.minutes(inMinutes % 60)} "
        : "";
    String sec = inSeconds > 0 ? "${inSeconds % 60} Sec " : "";
    return "$day$hour$min$sec";
  }

  String formatDuration(BuildContext context) {
    String negativeSign = isNegative ? '-' : '';
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitDays = twoDigits(inDays.remainder(356).abs());
    String twoDigitHours = twoDigits(inHours.remainder(24).abs());
    String twoDigitMinutes = twoDigits(inMinutes.remainder(60).abs());
    return "$negativeSign${inDays != 0 ? "${AppLocalizations.of(context)!.daysCount(twoDigitDays)} " : ""}${inHours != 0 ? "${AppLocalizations.of(context)!.hours(twoDigitHours)} " : ""}${inMinutes != 0 ? AppLocalizations.of(context)!.minutes(twoDigitMinutes) : ""}";
  }
}
