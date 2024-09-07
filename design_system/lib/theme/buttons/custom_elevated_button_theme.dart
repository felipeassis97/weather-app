import 'package:flutter/material.dart';

class CustomElevatedButtonTheme {
  static ElevatedButtonThemeData theme(context, ColorScheme colorScheme) {
    final textTheme = Theme.of(context).textTheme;
    // final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(colorScheme.secondary),
        foregroundColor: WidgetStatePropertyAll(colorScheme.onSurface),
        textStyle: WidgetStatePropertyAll(textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w700,
        )),
        padding: WidgetStatePropertyAll(const EdgeInsets.all(16)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        )),
      ),
    );
  }
}
