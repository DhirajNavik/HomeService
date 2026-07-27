import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homeservice/core/clippers/wave_clipper.dart';
import "../utils/app_palettes.dart";
import '../utils/dimens.dart';

PreferredSize commonAppBar({
  double appBarHeight = 100,
  Color? statusBarColor,
  Color? bgColor = AppPalettes.transparentColor,
  bool foregroundColor = true,
  bool goBack = true,
  Widget? child,
  String? title,
  List<Widget>? action,
  bool center = true,
  Brightness? statusBarMode,
  TextStyle? style,
}) => PreferredSize(
  preferredSize: Size.fromHeight(appBarHeight),
  child: ClipPath(
    clipper: WaveClipper(),
    child: Container(
      decoration: const BoxDecoration(gradient: AppPalettes.appbarGradient),
      child: AppBar(
        actionsPadding: EdgeInsets.only(right: Dimens.horizontalspacing),
        toolbarHeight: 60,
        surfaceTintColor: AppPalettes.transparentColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: statusBarColor,
          statusBarIconBrightness: statusBarMode,
        ),
        foregroundColor: foregroundColor ? AppPalettes.whiteColor : null,
        backgroundColor: bgColor,
        centerTitle: center,
        title: child ?? Text(title ?? "", style: style),
        actions: action,
      ),
    ),
  ),
);
