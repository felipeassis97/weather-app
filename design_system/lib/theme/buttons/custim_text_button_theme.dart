import 'package:flutter/material.dart';

class CustomTextButtonTheme {
  static TextButtonThemeData theme(context, ColorScheme colorScheme) {
    final textTheme = Theme.of(context).textTheme;

    return TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(colorScheme.onSurface),
        textStyle: WidgetStatePropertyAll(textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
            decorationColor: colorScheme.onSurface)),
        padding: WidgetStatePropertyAll(const EdgeInsets.all(16)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        )),
      ),
    );
  }
}
