import 'package:flutter/material.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';
import 'package:weather_app/common/utils/extensions/date_time_extension.dart';
import 'package:weather_app/common/utils/extensions/string_extension.dart';
import 'package:weather_app/features/home/data/models/response/current_location_model.dart';
import 'package:weather_app/features/home/data/models/response/day_response_model.dart';
import 'package:weather_app/features/home/data/models/response/hour_day_weather_model.dart';

class ForecastCurrentDayWidget extends StatefulWidget {
  final List<DayResponseModel> days;
  final CurrentLocationModel location;
  const ForecastCurrentDayWidget({
    super.key,
    required this.days,
    required this.location,
  });

  @override
  State<ForecastCurrentDayWidget> createState() =>
      _ForecastCurrentDayWidgetState();
}

class _ForecastCurrentDayWidgetState extends State<ForecastCurrentDayWidget> {
  late final List<HourDayWeatherModel> filteredList;

  @override
  void initState() {
    super.initState();
    _filterList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: filteredList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                width: 80,
                decoration: BoxDecoration(
                  color: context.colors.secondary,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: context.colors.onPrimary.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      filteredList[index].time.formattedSimpleHour(context),
                      style: context.text.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.colors.tertiary),
                    ),
                    const SizedBox(height: 4),
                    Image.network(
                      filteredList[index].condition.icon,
                      height: 60,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      filteredList[index]
                          .tempC
                          .round()
                          .toString()
                          .formatDegree(),
                      style: context.text.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.colors.tertiary),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  void _filterList() {
    final now = DateTime.now().fromTzDateTime(widget.location.tzId);

    filteredList =
        widget.days.first.hour.where((item) => item.time.isAfter(now)).toList();

    if (filteredList.length < 24) {
      final list =
          widget.days[1].hour.where((item) => item.time.isAfter(now)).toList();
      final remainingSlots = 24 - filteredList.length;
      filteredList.addAll(list.take(remainingSlots));
    }
  }
}
