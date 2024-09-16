import 'package:flutter/material.dart';
import 'package:weather_app/l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  //Styles
  TextTheme get text => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;
  Color get scaffoldColor => Theme.of(this).scaffoldBackgroundColor;
  ButtonStyle? get elevatedButtonStyle =>
      Theme.of(this).elevatedButtonTheme.style;

  AppLocalizations get textLocale => AppLocalizations.of(this)!;
  Locale get currentLocale => Localizations.localeOf(this);

  //Sizes
  double get widthSize => MediaQuery.sizeOf(this).width;
  double get heightSize => MediaQuery.sizeOf(this).height;
  double get appBarHeight => kToolbarHeight;

  // Current mode (light/dark)
  Brightness get brightness => MediaQuery.of(this).platformBrightness;

  ThemeMode get deviceMode =>
      brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
}
