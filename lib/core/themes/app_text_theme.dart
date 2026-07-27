import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_palettes.dart';

class AppTextTheme {
  AppTextTheme._();

  static const TextStyle _baseStyle = TextStyle(
    height: 1.2,
    letterSpacing: 0.2,
  );

  static TextTheme get lightTextTheme => _buildTextTheme(
    color: AppPalettes.textPrimary,
    secondaryColor: AppPalettes.textSecondary,
  );

  static TextTheme get darkTextTheme => _buildTextTheme(
    color: AppPalettes.textPrimary,
    secondaryColor: AppPalettes.textSecondary,
  );

  static TextTheme _buildTextTheme({
    required Color color,
    required Color secondaryColor,
  }) {
    return TextTheme(
      displayLarge: _baseStyle.copyWith(
        fontSize: 34.spMin,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      displayMedium: _baseStyle.copyWith(
        fontSize: 30.spMin,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      displaySmall: _baseStyle.copyWith(
        fontSize: 26.spMin,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      headlineLarge: _baseStyle.copyWith(
        fontSize: 24.spMin,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      headlineMedium: _baseStyle.copyWith(
        fontSize: 22.spMin,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      headlineSmall: _baseStyle.copyWith(
        fontSize: 20.spMin,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      titleLarge: _baseStyle.copyWith(
        fontSize: 18.spMin,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      titleMedium: _baseStyle.copyWith(
        fontSize: 16.spMin,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      titleSmall: _baseStyle.copyWith(
        fontSize: 14.spMin,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      bodyLarge: _baseStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodyMedium: _baseStyle.copyWith(
        fontSize: 14.spMin,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodySmall: _baseStyle.copyWith(
        fontSize: 12.spMin,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      labelLarge: _baseStyle.copyWith(
        fontSize: 14.spMin,
        fontWeight: FontWeight.w400,
        color: secondaryColor,
      ),
      labelMedium: _baseStyle.copyWith(
        fontSize: 12.spMin,
        fontWeight: FontWeight.w400,
        color: secondaryColor,
      ),
      labelSmall: _baseStyle.copyWith(
        fontSize: 10.spMin,
        fontWeight: FontWeight.w400,
        color: secondaryColor,
      ),
    );
  }
}
