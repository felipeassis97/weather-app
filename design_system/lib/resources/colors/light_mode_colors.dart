import 'package:flutter/material.dart';

class LightModeColors {
  static ColorScheme get dayContrast => _dayContrast;
  static ColorScheme get nightContrast => _nightContrast;

  static ColorScheme get _dayContrast => ColorScheme.fromSeed(
        contrastLevel: 1.0,
        brightness: Brightness.light,
        seedColor: Color(0xffFFB701),
        secondary: Colors.blueAccent.shade100,
        primary: Colors.yellow.shade50,
        tertiary: Colors.black,
        onTertiary: Colors.black,
        outlineVariant: Colors.black,
      );

  static ColorScheme get _nightContrast => ColorScheme.fromSeed(
        contrastLevel: 1.0,
        brightness: Brightness.light,
        seedColor: Color(0xff023047),
        primary: Color(0xffB1FFFF),
        secondary: Color(0xff023047),
        tertiary: Colors.white,
        onTertiary: Colors.black,
        outlineVariant: Colors.black,
      );
}
