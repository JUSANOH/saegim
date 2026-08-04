import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const Color background = Colors.white;
  static const Color subtitle = Colors.black54;

  static ThemeData get lightTheme {
    final theme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: background,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: background,
    );

    return theme.copyWith(
      textTheme: theme.textTheme.copyWith(
        headlineLarge: theme.textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: theme.textTheme.bodyLarge?.copyWith(
          color: subtitle,
        ),
      ),
    );
  }
}
