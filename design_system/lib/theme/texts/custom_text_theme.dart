import 'package:flutter/material.dart';

class CustomTextTheme {
  static TextTheme theme(ColorScheme colorScheme) {
    return TextTheme(
      // Display Fonts
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.25,
        fontFamily: 'RussoOne',
        package: 'design_system',
        color: colorScheme.outlineVariant,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.25,
        fontFamily: 'RussoOne',
        package: 'design_system',
        color: colorScheme.outlineVariant,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.25,
        fontFamily: 'RussoOne',
        package: 'design_system',
        color: colorScheme.outlineVariant,
      ),

      // Headline Fonts
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.25,
        fontFamily: 'RussoOne',
        package: 'design_system',
        color: colorScheme.outlineVariant,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.25,
        fontFamily: 'RussoOne',
        package: 'design_system',
        color: colorScheme.outlineVariant,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.25,
        fontFamily: 'RussoOne',
        package: 'design_system',
        color: colorScheme.outlineVariant,
      ),

      // Title Fonts
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w900,
        letterSpacing: -0.25,
        fontFamily: 'ChakraPetch',
        package: 'design_system',
        color: colorScheme.outlineVariant,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.25,
        fontFamily: 'ChakraPetch',
        package: 'design_system',
        color: colorScheme.outlineVariant,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.1,
        fontFamily: 'ChakraPetch',
        package: 'design_system',
        color: colorScheme.outlineVariant,
      ),

      // Label Fonts
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.1,
        fontFamily: 'ChakraPetch',
        package: 'design_system',
        color: colorScheme.outlineVariant,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        fontFamily: 'ChakraPetch',
        package: 'design_system',
        color: colorScheme.outlineVariant,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        fontFamily: 'ChakraPetch',
        package: 'design_system',
        color: colorScheme.outlineVariant,
      ),

      // Body Fonts
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        fontFamily: 'ChakraPetch',
        package: 'design_system',
        color: colorScheme.outlineVariant,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        fontFamily: 'ChakraPetch',
        package: 'design_system',
        color: colorScheme.outlineVariant,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        fontFamily: 'ChakraPetch',
        package: 'design_system',
        color: colorScheme.outlineVariant,
      ),
    );
  }
}
