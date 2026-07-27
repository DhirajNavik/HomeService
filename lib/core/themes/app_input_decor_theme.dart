import 'package:flutter/material.dart';
import 'app_text_theme.dart';
import '../utils/app_palettes.dart';
import '../utils/dimens.dart';

class AppInputDecorationTheme {
  const AppInputDecorationTheme._();

  static InputDecorationTheme get lightTheme => _buildTheme(
    themeColor: AppPalettes.blackColor,
    textStyle: AppTextTheme.lightTextTheme.bodyMedium,
    radius: Dimens.radiusX2,
    focusedBorderColor: AppPalettes.blackColor,
    padding: EdgeInsets.symmetric(
      vertical: Dimens.allPaddingX4,
      horizontal: Dimens.allPaddingX3,
    ),
  );
  static InputDecorationTheme get darkTheme => _buildTheme(
    themeColor: AppPalettes.whiteColor,
    textStyle: AppTextTheme.darkTextTheme.bodyMedium,
    radius: Dimens.radiusX2,
    focusedBorderColor: AppPalettes.whiteColor,
    padding: EdgeInsets.symmetric(
      vertical: Dimens.allPaddingX4,
      horizontal: Dimens.allPaddingX3,
    ),
  );

  static InputDecorationTheme _buildTheme({
    required Color themeColor,
    TextStyle? textStyle,
    required Color focusedBorderColor,
    required double radius,
    required EdgeInsets padding,
  }) {
    return InputDecorationTheme(
      errorMaxLines: 3,
      prefixIconColor: themeColor,
      suffixIconColor: themeColor,
      fillColor: WidgetStateColor.resolveWith((states) {
        return states.contains(WidgetState.focused)
            ? themeColor
            : AppPalettes.redColor;
      }),
      labelStyle: textStyle?.copyWith(fontWeight: FontWeight.bold),
      hintStyle: textStyle?.copyWith(
        color: AppPalettes.hintColor,
        fontWeight: FontWeight.w400,
      ),
      errorStyle: textStyle?.copyWith(
        color: AppPalettes.errorColor,
        fontWeight: FontWeight.w400,
      ),
      floatingLabelStyle: textStyle,
      prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),

      contentPadding: padding,
      border: _border(AppPalettes.liteTextFormFieldColor, radius: radius),

      enabledBorder: _border(
        AppPalettes.liteTextFormFieldColor,
        radius: radius,
      ),

      focusedBorder: _border(focusedBorderColor, radius: radius),

      errorBorder: _border(
        AppPalettes.errorColor.withOpacityExt(0.2),
        radius: radius,
      ),

      focusedErrorBorder: _border(AppPalettes.errorColor, radius: radius),
    );
  }

  static OutlineInputBorder _border(
    Color color, {
    required double radius,
    double width = 1,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
