import 'package:design_system/resources/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';
import 'package:weather_app/common/utils/extensions/string_extension.dart';
import 'package:weather_app/features/home/data/models/response/day_response_model.dart';
import 'package:weather_app/features/home/ui/widgets/weather_status_item_widget.dart';

class StatisticsBannerWidget extends StatelessWidget {
  final DayResponseModel weatherDay;
  const StatisticsBannerWidget({super.key, required this.weatherDay});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      height: 120,
      width: double.infinity,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          WeatherStatusItemWidget(
            label: context.textLocale.homeCurrentWeatherWind,
            value: weatherDay.maxWindMph.round().toString().formatMs(),
            iconPath: AppAssets.wind,
          ),
          WeatherStatusItemWidget(
            label: context.textLocale.homeCurrentWeatherHumidity,
            value: weatherDay.humidity.round().toString().formatPercentage(),
            iconPath: AppAssets.humidity,
          ),
          WeatherStatusItemWidget(
            label: context.textLocale.homeCurrentWeatherRain,
            value:
                weatherDay.chanceOfRain.round().toString().formatPercentage(),
            iconPath: AppAssets.raining,
          ),
          WeatherStatusItemWidget(
            label: context.textLocale.homeCurrentWeatherSunset,
            value: weatherDay.sunset,
            iconPath: AppAssets.sunset,
          ),
        ],
      ),
    );
  }
}
