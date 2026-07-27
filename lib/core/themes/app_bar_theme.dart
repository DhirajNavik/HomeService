import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_text_theme.dart';
import '../utils/app_palettes.dart';

class AppBarThemes {
  AppBarThemes._();

  static AppBarTheme get light => _buildTheme(
    backgroundColor: AppPalettes.transparentColor,
    overlayStyle: SystemUiOverlayStyle.dark,
    textStyle: AppTextTheme.lightTextTheme.titleLarge,
    themeColor: AppPalettes.blackColor,
    
  );

  static AppBarTheme get dark => _buildTheme(
    backgroundColor: AppPalettes.blackColor,
    overlayStyle: SystemUiOverlayStyle.light,
    textStyle: AppTextTheme.darkTextTheme.titleLarge,
    themeColor: AppPalettes.whiteColor,
  );

  static AppBarTheme _buildTheme({
    TextStyle? textStyle,
    required Color backgroundColor,
    required Color themeColor,
    required SystemUiOverlayStyle overlayStyle,
  }) {
    return AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      backgroundColor: backgroundColor,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: overlayStyle,
      iconTheme: IconThemeData(color: themeColor),
      actionsIconTheme: IconThemeData(color: themeColor),
      titleTextStyle: textStyle,
    );
  }
}
