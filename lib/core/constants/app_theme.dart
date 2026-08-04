import 'package:flutter/material.dart';
import 'package:saegim/core/constants/app_colors.dart';

abstract final class AppTheme {
  static ThemeData get lightTheme {
    final theme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.background,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: AppColors.background,
    );

    return theme.copyWith(
      textTheme: theme.textTheme.copyWith(
        headlineLarge: theme.textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: theme.textTheme.bodyLarge?.copyWith(
          color: AppColors.subtitle,
        ),
      ),
    );
  }
}
