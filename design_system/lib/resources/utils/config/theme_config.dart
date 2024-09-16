import 'package:flutter/material.dart';
import 'package:design_system/resources/colors/dark_mode_colors.dart';
import 'package:design_system/resources/colors/light_mode_colors.dart';
import 'package:design_system/resources/utils/config/contrast_type_enum.dart';

class ThemeConfig {
  final ThemeMode? themeMode;
  final Contrast? contrast;

  ThemeConfig({
    this.themeMode = ThemeMode.system,
    this.contrast = Contrast.day,
  });

  ColorScheme get colorScheme {
    if (themeMode == ThemeMode.light) {
      switch (contrast) {
        case Contrast.day:
          return LightModeColors.dayContrast;
        case Contrast.night:
          return LightModeColors.nightContrast;
        default:
          throw ('Contrast unknown');
      }
    } else {
      switch (contrast) {
        case Contrast.day:
          return DarkModeColors.dayContrast;
        case Contrast.night:
          return DarkModeColors.nightContrast;
        default:
          throw ('Contrast unknown');
      }
    }
  }
}
