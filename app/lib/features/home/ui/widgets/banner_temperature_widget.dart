import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:weather_app/common/utils/extensions/date_time_extension.dart';
import 'package:weather_app/common/utils/extensions/string_extension.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';
import 'package:weather_app/common/services/theme_control/theme_control.dart';
import 'package:weather_app/features/home/data/models/response/weather_model.dart';

class BannerTemperatureWidget extends StatelessWidget {
  final Weather weather;
  final ThemeControl themeControl;
  const BannerTemperatureWidget({
    super.key,
    required this.weather,
    required this.themeControl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              weather.location.name,
              style: context.text.titleLarge?.copyWith(
                color: context.colors.tertiary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${weather.current.tempC.round()}°',
              style: context.text.displayLarge?.copyWith(
                color: context.colors.tertiary,
              ),
            ),
            Row(
              children: [
                Text(
                  'Min: ${weather.day.first.minTempC.round().toString().formatDegree()}',
                  style: context.text.labelLarge?.copyWith(
                    color: context.colors.tertiary,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Max: ${weather.day.first.maxTempC.round().toString().formatDegree()}',
                  style: context.text.labelLarge?.copyWith(
                    color: context.colors.tertiary,
                  ),
                ),
              ],
            ),
            Text(
              weather.location.localtime.fullDate(context),
              style: context.text.labelSmall?.copyWith(
                color: context.colors.tertiary,
              ),
            )
          ],
        ),
        const Spacer(),
        AnimationPreviewWidget(
            height: 160,
            filePath: themeControl.animationWeatherPath(
              weather.current.condition.type,
            )),
      ],
    );
  }
}
