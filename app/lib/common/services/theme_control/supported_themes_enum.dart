import 'package:flutter/material.dart';
import 'package:weather_app/l10n/app_localizations.dart';

enum SupportedThemesEnum {
  light(ThemeMode.light),
  dark(ThemeMode.dark);

  final ThemeMode mode;
  const SupportedThemesEnum(this.mode);

  static SupportedThemesEnum fromMode(String mode) {
    switch (mode) {
      case 'dark':
        return SupportedThemesEnum.dark;
      case 'light':
        return SupportedThemesEnum.light;
      default:
        throw Exception('Type not found');
    }
  }

  @override
  String toString([AppLocalizations? localization]) {
    if (localization == null) {
      throw Exception('Localization not found');
    }
    switch (this) {
      case SupportedThemesEnum.light:
        return localization.settingsModeLight;
      case SupportedThemesEnum.dark:
        return localization.settingsModeDark;
      default:
        throw Exception('Type not found');
    }
  }
}
