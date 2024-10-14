import 'package:weather_app/common/exceptions/i_weather_exception.dart';
import 'package:weather_app/common/services/theme_control/supported_locales_enum.dart';
import 'package:weather_app/common/services/theme_control/supported_themes_enum.dart';

abstract interface class ISettingsRepository {
  Future<SupportedLocalesEnum> getLanguage();
  Future<(void, IWeatherException?)> saveLanguage({
    required SupportedLocalesEnum locale,
  });

  Future<SupportedThemesEnum> getTheme();
  Future<(void, IWeatherException?)> saveTheme({
    required SupportedThemesEnum theme,
  });
}
