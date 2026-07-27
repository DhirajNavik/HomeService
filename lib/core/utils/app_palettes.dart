import 'package:flutter/material.dart';

class AppPalettes {
  static const lightBackgroundColor = Color.fromARGB(255, 249, 249, 249);
  static const darkBackgroundColor = Color(0x1AEDE7E0);
  static const darkCardColor = Color(0x1AEDE7E0);
  static const lightCardColor = Color.fromARGB(255, 224, 224, 224);
  static const textPrimary = Color.fromRGBO(15, 23, 42, 1);
  static const textSecondary = Color.fromRGBO(100, 116, 139, 1);
  static const checkColor = Color.fromRGBO(10, 130, 54, 1);

  static const lightPrimaryColor = Color(0xffF3F4F4);
  static const lightSecondaryColor = Color(0xFF9E9E9E);

  static const primaryColor = Color(0xff05228A);
  static const secondaryColor = Color.fromARGB(255, 36, 75, 213);
  static const iconColor = Color(0xffF3F4F4);
  static const shimmerColor = Color.fromARGB(255, 218, 219, 219);

  static const errorColor = Color.fromRGBO(239, 68, 68, 1);
  static const blackColor = Color(0xff000000);
  static const greyColor = Color(0xFF9E9E9E);
  static const hintColor = Color(0xFF9E9E9E);
  static const whiteColor = Color(0xFFFFFFFF);
  static const Color transparentColor = Colors.transparent;
  static const shadowColor = Color(0xffF3F4F4);
  static const liteGreyColor = Color(0xffF3F4F4);
  static const liteTextFormFieldColor = Color.fromARGB(255, 187, 189, 189);
  static const redColor = Colors.red;
  static const gradientFirstColor = Color(0xFF1E40AF);
  static const gradientSecondColor = Color(0xFF3B82F6);
  static const lightBrownColor = Color(0xFFE3B99C);
  static const appbarGradient = LinearGradient(
    colors: [AppPalettes.gradientFirstColor, AppPalettes.gradientSecondColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

extension ColorWithOpacity on Color {
  Color withOpacityExt(double val) {
    return withValues(alpha: val);
  }
}
