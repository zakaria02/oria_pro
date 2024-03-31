import 'package:flutter/material.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/entity/day_availability.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/appointments/widgets/hour_card.dart';

class PeriodAvailabilities extends StatelessWidget {
  final String title;
  final List<DayAvailability> availabilities;
  final String suffix;

  const PeriodAvailabilities({
    super.key,
    required this.title,
    required this.availabilities,
    required this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 3,
            childAspectRatio: (3 / 1),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: availabilities.map((date) {
              return HourCard(
                date: date,
                suffix: suffix,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
