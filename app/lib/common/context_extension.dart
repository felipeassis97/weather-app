import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  //Styles
  TextTheme get text => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;
  Color get scaffoldColor => Theme.of(this).scaffoldBackgroundColor;

  //Sizes
  double get widthSize => MediaQuery.sizeOf(this).width;
  double get heightSize => MediaQuery.sizeOf(this).height;
  double get appBarHeight => kToolbarHeight;

  // Current mode (light/dark)
  Brightness get brightness =>
      View.of(this).platformDispatcher.platformBrightness;

  ThemeMode get deviceMode =>
      brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
}
