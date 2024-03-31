import 'package:oria_pro/client/moduls/expert/business/locator/expert_locator.dart';
import 'package:oria_pro/client/moduls/expert/business/repository/expert_repository.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/entity/day_availability.dart';
import 'package:oria_pro/utils/extensions/date_extensions.dart';
import 'package:oria_pro/utils/extensions/string_extensions.dart';

class GetDayAvailabilitiesUseCase {
  final ExpertRepository _repository = ExpertLocator().get();
  Future<List<DayAvailability>> execute(String expertId, DateTime day) async {
    List<DayAvailability> availabilities = [];

    final result =
        await _repository.getDayAvailabilities(expertId, day.toApiDate());

    /////

    DateTime avaliableHour = result.day.toOriaDateTime();

    avaliableHour = avaliableHour.addHourAndMinutesAndTransformToLocal(
        int.parse(result.hours.hour1.time.substring(0, 2)),
        int.parse(result.hours.hour1.time.substring(3)));

    availabilities.add(DayAvailability(
        date: avaliableHour,
        period: _getHourPeriod(avaliableHour.hour),
        available: result.hours.hour1.available));

    /////

    avaliableHour = result.day.toOriaDateTime();

    avaliableHour = avaliableHour.addHourAndMinutesAndTransformToLocal(
        int.parse(result.hours.hour2.time.substring(0, 2)),
        int.parse(result.hours.hour2.time.substring(3)));

    availabilities.add(DayAvailability(
      date: avaliableHour,
      period: _getHourPeriod(avaliableHour.hour),
      available: result.hours.hour2.available,
    ));

    /////

    avaliableHour = result.day.toOriaDateTime();

    avaliableHour = avaliableHour.addHourAndMinutesAndTransformToLocal(
        int.parse(result.hours.hour3.time.substring(0, 2)),
        int.parse(result.hours.hour3.time.substring(3)));

    availabilities.add(DayAvailability(
      date: avaliableHour,
      period: _getHourPeriod(avaliableHour.hour),
      available: result.hours.hour3.available,
    ));

    /////

    avaliableHour = result.day.toOriaDateTime();

    avaliableHour = avaliableHour.addHourAndMinutesAndTransformToLocal(
        int.parse(result.hours.hour4.time.substring(0, 2)),
        int.parse(result.hours.hour4.time.substring(3)));

    availabilities.add(DayAvailability(
      date: avaliableHour,
      period: _getHourPeriod(avaliableHour.hour),
      available: result.hours.hour4.available,
    ));

    /////

    avaliableHour = result.day.toOriaDateTime();

    avaliableHour = avaliableHour.addHourAndMinutesAndTransformToLocal(
        int.parse(result.hours.hour5.time.substring(0, 2)),
        int.parse(result.hours.hour5.time.substring(3)));

    availabilities.add(DayAvailability(
      date: avaliableHour,
      period: _getHourPeriod(avaliableHour.hour),
      available: result.hours.hour5.available,
    ));

    /////

    avaliableHour = result.day.toOriaDateTime();

    avaliableHour = avaliableHour.addHourAndMinutesAndTransformToLocal(
        int.parse(result.hours.hour6.time.substring(0, 2)),
        int.parse(result.hours.hour6.time.substring(3)));

    availabilities.add(DayAvailability(
      date: avaliableHour,
      period: _getHourPeriod(avaliableHour.hour),
      available: result.hours.hour6.available,
    ));

    /////

    avaliableHour = result.day.toOriaDateTime();

    avaliableHour = avaliableHour.addHourAndMinutesAndTransformToLocal(
        int.parse(result.hours.hour7.time.substring(0, 2)),
        int.parse(result.hours.hour7.time.substring(3)));

    availabilities.add(DayAvailability(
      date: avaliableHour,
      period: _getHourPeriod(avaliableHour.hour),
      available: result.hours.hour7.available,
    ));

    /////

    avaliableHour = result.day.toOriaDateTime();

    avaliableHour = avaliableHour.addHourAndMinutesAndTransformToLocal(
        int.parse(result.hours.hour8.time.substring(0, 2)),
        int.parse(result.hours.hour8.time.substring(3)));

    availabilities.add(DayAvailability(
      date: avaliableHour,
      period: _getHourPeriod(avaliableHour.hour),
      available: result.hours.hour8.available,
    ));

    /////

    avaliableHour = result.day.toOriaDateTime();

    avaliableHour = avaliableHour.addHourAndMinutesAndTransformToLocal(
        int.parse(result.hours.hour9.time.substring(0, 2)),
        int.parse(result.hours.hour9.time.substring(3)));

    availabilities.add(DayAvailability(
      date: avaliableHour,
      period: _getHourPeriod(avaliableHour.hour),
      available: result.hours.hour9.available,
    ));

    /////

    avaliableHour = result.day.toOriaDateTime();

    avaliableHour = avaliableHour.addHourAndMinutesAndTransformToLocal(
        int.parse(result.hours.hour10.time.substring(0, 2)),
        int.parse(result.hours.hour10.time.substring(3)));

    availabilities.add(DayAvailability(
      date: avaliableHour,
      period: _getHourPeriod(avaliableHour.hour),
      available: result.hours.hour10.available,
    ));

    /////

    avaliableHour = result.day.toOriaDateTime();

    avaliableHour = avaliableHour.addHourAndMinutesAndTransformToLocal(
        int.parse(result.hours.hour11.time.substring(0, 2)),
        int.parse(result.hours.hour11.time.substring(3)));

    availabilities.add(DayAvailability(
      date: avaliableHour,
      period: _getHourPeriod(avaliableHour.hour),
      available: result.hours.hour11.available,
    ));

    /////

    avaliableHour = result.day.toOriaDateTime();

    avaliableHour = avaliableHour.addHourAndMinutesAndTransformToLocal(
        int.parse(result.hours.hour12.time.substring(0, 2)),
        int.parse(result.hours.hour12.time.substring(3)));

    availabilities.add(DayAvailability(
      date: avaliableHour,
      period: _getHourPeriod(avaliableHour.hour),
      available: result.hours.hour12.available,
    ));

    return availabilities;
  }
}

Period _getHourPeriod(int hour) {
  if (hour >= 0 && hour < 12) {
    return Period.morning;
  }
  if (hour < 18) {
    return Period.evening;
  }

  return Period.night;
}
