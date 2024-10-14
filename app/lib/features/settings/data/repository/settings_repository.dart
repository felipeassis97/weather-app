import 'dart:developer';

import 'package:weather_app/common/exceptions/i_weather_exception.dart';
import 'package:weather_app/common/services/cache/controllers_enum.dart';
import 'package:weather_app/common/services/cache/i_cache_manager.dart';
import 'package:weather_app/common/services/theme_control/supported_locales_enum.dart';
import 'package:weather_app/common/services/theme_control/supported_themes_enum.dart';
import 'package:weather_app/features/settings/data/repository/i_settings_repository.dart';

class SettingsRepository implements ISettingsRepository {
  final ICacheManager cacheManager;
  const SettingsRepository({required this.cacheManager});

  @override
  Future<(void, IWeatherException?)> saveLanguage(
      {required SupportedLocalesEnum locale}) async {
    try {
      await cacheManager.save(ControllersEnum.language, locale.code);
      return (null, null);
    } on CacheException catch (e) {
      return (null, e);
    }
  }

  @override
  Future<SupportedLocalesEnum> getLanguage() async {
    final lang = await cacheManager.get(ControllersEnum.language);

    return lang != null
        ? SupportedLocalesEnum.fromCode(lang)
        : SupportedLocalesEnum.en;
  }

  @override
  Future<SupportedThemesEnum> getTheme() async {
    final mode = await cacheManager.get(ControllersEnum.themeMode);

    return mode != null
        ? SupportedThemesEnum.fromMode(mode)
        : SupportedThemesEnum.light;
  }

  @override
  Future<(void, IWeatherException?)> saveTheme(
      {required SupportedThemesEnum theme}) async {
    try {
      await cacheManager.save(ControllersEnum.themeMode, theme.mode.name);
      return (null, null);
    } on CacheException catch (e) {
      return (null, e);
    }
  }
}
