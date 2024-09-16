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
        //color: colorScheme.onTertiary,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.25,
        fontFamily: 'RussoOne',
        package: 'design_system',
        //color: colorScheme.onTertiary,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.25,
        fontFamily: 'RussoOne',
        package: 'design_system',
        //color: colorScheme.onTertiary,
      ),

      // Headline Fonts
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.25,
        fontFamily: 'RussoOne',
        package: 'design_system',
        //color: colorScheme.onTertiary,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.25,
        fontFamily: 'RussoOne',
        package: 'design_system',
        //color: colorScheme.onTertiary,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.25,
        fontFamily: 'RussoOne',
        package: 'design_system',
        //color: colorScheme.onTertiary,
      ),

      // Title Fonts
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w900,
        letterSpacing: -0.25,
        fontFamily: 'ChakraPetch',
        package: 'design_system',
        //color: colorScheme.onTertiary,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.25,
        fontFamily: 'ChakraPetch',
        package: 'design_system',
        //color: colorScheme.onTertiary,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.1,
        fontFamily: 'ChakraPetch',
        package: 'design_system',
        //color: colorScheme.onTertiary,
      ),

      // Label Fonts
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.1,
        fontFamily: 'ChakraPetch',
        package: 'design_system',
        //color: colorScheme.onTertiary,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        fontFamily: 'ChakraPetch',
        package: 'design_system',
        //color: colorScheme.onTertiary,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        fontFamily: 'ChakraPetch',
        package: 'design_system',
        //color: colorScheme.onTertiary,
      ),

      // Body Fonts
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        fontFamily: 'ChakraPetch',
        package: 'design_system',
        //color: colorScheme.onTertiary,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        fontFamily: 'ChakraPetch',
        package: 'design_system',
        //color: colorScheme.onTertiary,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        fontFamily: 'ChakraPetch',
        package: 'design_system',
        //color: colorScheme.onTertiary,
      ),
    );
  }
}
