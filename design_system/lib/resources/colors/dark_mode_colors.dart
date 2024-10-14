import 'package:flutter/material.dart';

class DarkModeColors {
  static ColorScheme get dayContrast => _dayContrast;
  static ColorScheme get nightContrast => _nightContrast;

  static ColorScheme get _dayContrast => ColorScheme.fromSeed(
        contrastLevel: 1.0,
        brightness: Brightness.dark,
        seedColor: Color(0XFF023553),
        primary: Color(0XFF47BBE1),
        secondary: Color(0XFF104084),
        tertiary: Colors.white,
        onTertiary: Colors.black,
        outlineVariant: Colors.white,
      );

  static ColorScheme get _nightContrast => ColorScheme.fromSeed(
        contrastLevel: 1.0,
        brightness: Brightness.dark,
        seedColor: Color(0XFF47BBE1),
        primary: Color(0XFF001026),
        secondary: Color(0XFF104084),
        tertiary: Colors.white,
        onTertiary: Colors.black,
        outlineVariant: Colors.white,
      );
}
