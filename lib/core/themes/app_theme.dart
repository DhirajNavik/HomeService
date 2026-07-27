import 'package:flutter/material.dart';
import './app_input_decor_theme.dart';
import 'app_bar_theme.dart';
import 'app_text_theme.dart';
import '../utils/app_palettes.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme =>
      ThemeData.light(useMaterial3: true).copyWith(
        brightness: Brightness.light,
        primaryColor: AppPalettes.primaryColor,
        scaffoldBackgroundColor: AppPalettes.lightBackgroundColor,
        primaryColorLight: AppPalettes.lightPrimaryColor,
        primaryColorDark: AppPalettes.lightSecondaryColor,
        cardColor: AppPalettes.lightCardColor,
        disabledColor: AppPalettes.greyColor,
        inputDecorationTheme: AppInputDecorationTheme.lightTheme,
        appBarTheme: AppBarThemes.light,
        textTheme: AppTextTheme.lightTextTheme,
      );
  static ThemeData get darkTheme =>
      ThemeData.light(useMaterial3: true).copyWith(
        brightness: Brightness.dark,
        primaryColor: AppPalettes.primaryColor,
        scaffoldBackgroundColor: AppPalettes.darkBackgroundColor,
        cardColor: AppPalettes.darkCardColor,
        disabledColor: AppPalettes.greyColor,
        inputDecorationTheme: AppInputDecorationTheme.darkTheme,
        appBarTheme: AppBarThemes.dark,
        textTheme: AppTextTheme.darkTextTheme,
      );
}
