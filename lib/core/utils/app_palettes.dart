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


  static const splashColor = Color.fromRGBO(25, 118, 210, 1);
  static const errorColor = Color.fromRGBO(239, 68, 68, 1);
  static const pendingColor = Color.fromRGBO(229, 127, 31, 1);
  static const blackColor = Color(0xff000000);
  static const greyColor = Color(0xFF9E9E9E);
  static const hintColor = Color(0xFF9E9E9E);
  static const yellowColor = Color.fromARGB(255, 227, 234, 36);
  static const whiteColor = Color(0xFFFFFFFF);
  static const Color transparentColor = Colors.transparent;
  static const shadowColor = Color(0xffF3F4F4);
  static const liteGreyColor = Color(0xffF3F4F4);
  static const liteTextFormFieldColor = Color.fromARGB(255, 187, 189, 189);
  static const redColor = Colors.red;
  static const borderColor = Color(0xFFE2E8F0);
  static const calendarPresentColor = Color(0xff369F27);
  static const calendarAbsentColor = Color(0xffB60003);
  static const calendarLateColor = Color.fromARGB(255, 215, 188, 13);

  static const gradientFirstColor = Color(0xFF1E40AF);
  static const gradientSecondColor = Color(0xFF3B82F6);
  static const lightBrownColor = Color(0xFFE3B99C);
  static const appbarGradient = LinearGradient(
    colors: [Color(0xFF4E18B0), Color(0xFF4E18B0), Color(0xFF6418B0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

extension ColorWithOpacity on Color {
  Color withOpacityExt(double val) {
    return withValues(alpha: val);
  }
}
