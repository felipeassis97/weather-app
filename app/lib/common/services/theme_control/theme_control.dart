import 'package:design_system/resources/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:design_system/resources/utils/config/theme_config.dart';
import 'package:design_system/resources/utils/config/contrast_type_enum.dart';
import 'package:weather_app/common/services/theme_control/supported_locales_enum.dart';
import 'package:weather_app/common/services/theme_control/supported_themes_enum.dart';
import 'package:weather_app/features/home/data/models/response/weather_type_enum.dart';

class ThemeControl {
  var _config = ThemeConfig();
  ThemeConfig get config => _config;

  var _locale = Locale(SupportedLocalesEnum.en.code);
  Locale get locale => _locale;

  final List<SupportedLocalesEnum> _supportedLocales = [
    SupportedLocalesEnum.en,
    SupportedLocalesEnum.es,
    SupportedLocalesEnum.pt
  ];
  List<SupportedLocalesEnum> get supportedLocales => _supportedLocales;

  final List<SupportedThemesEnum> _supportedThemes = [
    SupportedThemesEnum.dark,
    SupportedThemesEnum.light
  ];
  List<SupportedThemesEnum> get supportedThemes => _supportedThemes;

  /// Control theme updated
  final ValueNotifier<bool> updated = ValueNotifier(false);

  void setNewLocale(Locale value) {
    _locale = value;
    updated.value = !updated.value;
  }

  void setNewConfig(ThemeConfig value) {
    _config = value;
    updated.value = !updated.value;
  }

  void setThemeMode(ThemeMode mode) {
    _config = ThemeConfig(
      themeMode: mode,
      contrast: _config.contrast,
    );
    updated.value = !updated.value;
  }

  void setNewContrast(Contrast contrast) {
    _config = ThemeConfig(
      themeMode: _config.themeMode,
      contrast: contrast,
    );
    updated.value = !updated.value;
  }

  String animationWeatherPath(WeatherType type) {
    final isDay = _config.contrast == Contrast.day;

    switch (type) {
      case WeatherType.clear:
        return isDay ? AppAssets.clearDay : AppAssets.clearNight;

      case WeatherType.lightRain:
      case WeatherType.lightRainShower:
      case WeatherType.lightDrizzle:
      case WeatherType.moderateRain:
        return isDay ? AppAssets.lightRainDay : AppAssets.lightRainNight;

      case WeatherType.mist:
      case WeatherType.fog:
        return isDay ? AppAssets.mistDay : AppAssets.mistNight;

      case WeatherType.partlyCloudy:
      case WeatherType.cloudy:
      case WeatherType.overcast:
      case WeatherType.thundery:
        return isDay ? AppAssets.cloudyDay : AppAssets.clearNight;

      case WeatherType.lightRain:
      case WeatherType.patchyLightDrizzle:
      case WeatherType.patchyRainNearby:
      case WeatherType.patchyLightRain:
        return isDay ? AppAssets.rainingDay : AppAssets.rainingNight;

      case WeatherType.sunny:
        return AppAssets.sunnyDay;

      default:
        return AppAssets.clearDay;
    }
  }
}
