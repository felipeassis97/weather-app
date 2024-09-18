import 'package:flutter/material.dart';
import 'package:weather_app/common/services/theme_control/theme_control.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';
import 'package:weather_app/features/home/data/models/response/weather_model.dart';
import 'package:weather_app/features/home/ui/widgets/banner_temperature_widget.dart';
import 'package:weather_app/features/home/ui/widgets/forecast_current_day_widget.dart';
import 'package:weather_app/features/home/ui/widgets/forecast_next_days_widget.dart';
import 'package:weather_app/features/home/ui/widgets/statitiscs_banner_widget.dart';

class ForecastWidget extends StatelessWidget {
  final Weather weather;
  final ThemeControl themeControl;
  const ForecastWidget({
    super.key,
    required this.weather,
    required this.themeControl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BannerTemperatureWidget(
          weather: weather,
          themeControl: themeControl,
        ),
        const SizedBox(height: 16),
        StatisticsBannerWidget(weatherDay: weather.day.first),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            context.textLocale.homeTodayLabel,
            style: context.text.titleMedium
                ?.copyWith(color: context.colors.tertiary),
          ),
        ),
        const SizedBox(height: 8),
        ForecastCurrentDayWidget(
          days: weather.day,
          location: weather.location,
        ),
        Expanded(
          child: ForecastNextDaysWidget(
            days: weather.day,
          ),
        ),
      ],
    );
  }
}
