import 'package:flutter/material.dart';

class LightModeColors {
  static ColorScheme get dayContrast => _dayContrast;
  static ColorScheme get nightContrast => _nightContrast;

  static ColorScheme get _dayContrast => ColorScheme.fromSeed(
      contrastLevel: 1.0,
      brightness: Brightness.light,
      seedColor: Color(0xffFFB701),
      primary: Colors.yellow.shade50);

  static ColorScheme get _nightContrast => ColorScheme.fromSeed(
        contrastLevel: 1.0,
        brightness: Brightness.light,
        seedColor: Color(0xff023047),
        primary: Colors.blueAccent.shade100,
      );
}
