import 'package:design_system/resources/utils/config/theme_config.dart';
import 'package:design_system/theme/buttons/custim_text_button_theme.dart';
import 'package:design_system/theme/buttons/custom_elevated_button_theme.dart';
import 'package:design_system/theme/texts/custom_text_theme.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData theme(BuildContext context, {ThemeConfig? config}) {
    final _colorScheme =
        config != null ? config.colorScheme : ThemeConfig().colorScheme;

    return ThemeData(
      useMaterial3: true,
      colorScheme: _colorScheme,
      textTheme: CustomTextTheme.theme(_colorScheme),
      navigationBarTheme: NavigationBarThemeData(
          indicatorColor: _colorScheme.secondary,
          backgroundColor: _colorScheme.onPrimary,
          elevation: 1),
      radioTheme: RadioThemeData(
        fillColor: WidgetStatePropertyAll(_colorScheme.secondary),
        splashRadius: 30.0,
      ),
      appBarTheme: AppBarTheme(
        color: _colorScheme.secondary,
        elevation: 0,
        //shadowColor: _colorScheme.primary,
      ),
      elevatedButtonTheme:
          CustomElevatedButtonTheme.theme(context, _colorScheme),
      textButtonTheme: CustomTextButtonTheme.theme(context, _colorScheme),
    );
  }
}
