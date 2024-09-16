import 'package:flutter/material.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';
import 'package:weather_app/common/utils/extensions/date_time_extension.dart';
import 'package:weather_app/common/utils/extensions/string_extension.dart';
import 'package:weather_app/features/home/data/models/response/day_response_model.dart';

class ForecastNextDaysWidget extends StatelessWidget {
  final List<DayResponseModel> days;

  const ForecastNextDaysWidget({super.key, required this.days});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shrinkWrap: true,
        itemCount: days.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  days[index].date.dayOfWeek(context),
                  style: context.text.titleMedium
                      ?.copyWith(color: context.colors.tertiary),
                ),
              ),
              Text(
                days[index].minTempC.round().toString().formatDegree(),
                style: context.text.bodyMedium?.copyWith(
                  color: context.colors.tertiary.withOpacity(0.9),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 56,
                child: Divider(
                  color: context.colors.tertiary.withOpacity(0.9),
                  thickness: 2,
                ),
              ),
              const Spacer(),
              Text(
                days[index].maxTempC.round().toString().formatDegree(),
                style: context.text.labelLarge
                    ?.copyWith(color: context.colors.tertiary),
              ),
              const Spacer(),
              Image.network(
                days[index]
                    .hour
                    .firstWhere((e) => e.time.hour == 11)
                    .condition
                    .icon,
                height: 40,
              ),
            ],
          );
        });
  }
}
