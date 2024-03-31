import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension DateTimeExtensions on DateTime? {
  String? dateToText(context) {
    if (this != null) {
      List<String> months = [
        AppLocalizations.of(context)!.january,
        AppLocalizations.of(context)!.february,
        AppLocalizations.of(context)!.march,
        AppLocalizations.of(context)!.april,
        AppLocalizations.of(context)!.may,
        AppLocalizations.of(context)!.june,
        AppLocalizations.of(context)!.july,
        AppLocalizations.of(context)!.august,
        AppLocalizations.of(context)!.september,
        AppLocalizations.of(context)!.october,
        AppLocalizations.of(context)!.november,
        AppLocalizations.of(context)!.december,
      ];
      return "${this!.day} ${months[this!.month - 1]} ${this!.year}";
    }
    return null;
  }

  String? toOriaIsoDate() {
    if (this != null) {
      return "${this!.day > 9 ? this!.day : '0${this!.day}'}."
          "${this!.month > 9 ? this!.month : '0${this!.month}'}."
          "${this!.year}";
    }
    return null;
  }

  String? toIsoDateTime() {
    if (this != null) {
      return "${this!.day > 9 ? this!.day : '0${this!.day}'}/"
          "${this!.month > 9 ? this!.month : '0${this!.month}'}/"
          "${this!.year.toString().substring(2)} - "
          "${this!.hour > 9 ? this!.hour : '0${this!.hour}'}:"
          "${this!.minute > 9 ? this!.minute : '0${this!.minute}'}";
    }
    return null;
  }

  String? toHour() {
    if (this != null) {
      return "${this!.hour > 9 ? this!.hour : '0${this!.hour}'}:"
          "${this!.minute > 9 ? this!.minute : '0${this!.minute}'}";
    }
    return null;
  }

  String? toIsoMonthYearHourMinute() {
    if (this != null) {
      return "${this!.day > 9 ? this!.day : '0${this!.day}'}."
          "${this!.month > 9 ? this!.month : '0${this!.month}'}/"
          "${this!.hour > 9 ? this!.hour : '0${this!.hour}'}:"
          "${this!.minute > 9 ? this!.minute : '0${this!.minute}'}";
    }
    return null;
  }

  String? toNamedDayDateWithHourAndMinute() {
    if (this != null) {
      String dayName = DateFormat.EEEE('en-CA	').format(this!);
      return "$dayName ${this!.day > 9 ? "${this!.day}" : "0${this!.day}"}."
          "${this!.month > 9 ? "${this!.month}" : "0${this!.month}"} - "
          "${this!.hour > 9 ? "${this!.hour}" : "0${this!.hour}"}:"
          "${this!.minute > 9 ? "${this!.minute}" : "0${this!.minute}"}";
    }
    return null;
  }

  String? toDayAndMonth(context) {
    if (this != null) {
      List<String> monthAbbreviations = [
        AppLocalizations.of(context)!.jan,
        AppLocalizations.of(context)!.feb,
        AppLocalizations.of(context)!.mar,
        AppLocalizations.of(context)!.apr,
        AppLocalizations.of(context)!.may,
        AppLocalizations.of(context)!.jun,
        AppLocalizations.of(context)!.jul,
        AppLocalizations.of(context)!.aug,
        AppLocalizations.of(context)!.sep,
        AppLocalizations.of(context)!.oct,
        AppLocalizations.of(context)!.nov,
        AppLocalizations.of(context)!.dec,
      ];

      return "${monthAbbreviations[this!.month - 1]} "
          "${this!.day}";
    }
    return null;
  }

  String toAbbreviationMonthDate(context, {bool withTime = true}) {
    List<String> monthAbbreviations = [
      AppLocalizations.of(context)!.jan,
      AppLocalizations.of(context)!.feb,
      AppLocalizations.of(context)!.mar,
      AppLocalizations.of(context)!.apr,
      AppLocalizations.of(context)!.may,
      AppLocalizations.of(context)!.jun,
      AppLocalizations.of(context)!.jul,
      AppLocalizations.of(context)!.aug,
      AppLocalizations.of(context)!.sep,
      AppLocalizations.of(context)!.oct,
      AppLocalizations.of(context)!.nov,
      AppLocalizations.of(context)!.dec,
    ];

    return "${this!.day > 9 ? "${this!.day}" : "0${this!.day}"} "
        "${monthAbbreviations[this!.month - 1]} ${this!.year}"
        "${withTime ? " - ${this!.hour > 9 ? "${this!.hour}" : "0${this!.hour}"}:"
            "${this!.minute > 9 ? "${this!.minute}" : "0${this!.minute}"}" : ""}";
  }

  String toApiDate() {
    final date = this!;
    return "${date.day}-${date.month}-${date.year}";
  }

  DateTime addHourAndMinutesAndTransformToLocal(int hours, int minutes) {
    final date =
        DateTime.utc(this!.year, this!.month, this!.day, hours, minutes);
    return date.toLocal();
  }

  String toDetailedDate(BuildContext context) {
    return "${this!.hour > 9 ? this!.hour : '0${this!.hour}'}"
        ":${this!.minute > 9 ? this!.minute : '0${this!.minute}'}"
        "${this!.hour > 9 ? "PM" : "AM"} - "
        "${toAbbreviationMonthDate(context, withTime: false)}";
  }
}
