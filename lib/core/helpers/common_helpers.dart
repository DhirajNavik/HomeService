import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import '../utils/app_palettes.dart';
import '../utils/dimens.dart';
import 'package:flutter_svg/svg.dart';
import 'decoration.dart';

class CommonHelpers {
  static Widget shimmer({double? radius, Widget? child}) {
    return Shimmer.fromColors(
      baseColor: AppPalettes.shimmerColor,
      highlightColor: AppPalettes.whiteColor,
      child:
          child ??
          Container(
            decoration: BoxDecoration(
              color: AppPalettes.whiteColor,
              borderRadius: BorderRadius.circular(radius ?? 0),
            ),
          ),
    );
  }

  static Widget buildIcons({
    required String path,
    double? iconSize,
    Function()? onTap,
    Color? iconColor,
    Color? color,
    Color? borderColor,
    EdgeInsets? padding,
    double? radius,
  }) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(AppPalettes.transparentColor),
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? Dimens.radius100),
          color: color,
          border: Border.all(
            width: 1,
            color: borderColor ?? AppPalettes.transparentColor,
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: path.endsWith('.svg')
              ? SvgPicture.asset(
                  path,
                  height: iconSize,
                  width: iconSize,
                  colorFilter: iconColor == null
                      ? null
                      : ColorFilter.mode(iconColor, BlendMode.srcIn),
                )
              : Image.asset(path, height: iconSize, color: iconColor),
        ),
      ),
    );
  }

  static Widget buildIconsContainer({
    double? iconSize,
    Function()? onTap,
    Color? iconColor,
    Color? color,
    double? padding,
    double? radius,
    required Widget? child,
  }) {
    return InkWell(
      customBorder: const CircleBorder(),
      overlayColor: WidgetStatePropertyAll(AppPalettes.lightPrimaryColor),
      onTap: onTap,
      child: Container(
        width: iconSize,
        height: iconSize,
        alignment: Alignment.center,
        padding: EdgeInsets.all(padding ?? 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? Dimens.radius100),
          color: color,
        ),
        child: child,
      ),
    );
  }

  static Widget showInitials(
    String initials, {
    TextStyle? style,
    Color? color,
  }) {
    return Center(child: Text(getInitials(initials), style: style));
  }

  static Widget buildOneLineText(String text, {TextStyle? style}) {
    return Flexible(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(text, style: style),
      ),
    );
  }

  static Widget getCacheNetworkImage(
    String? image, {
    Widget? placeholder,
    BoxFit? fit,
    bool showShimmer = true,
    Color? backgroundColor,
  }) {
    return CachedNetworkImage(
      imageUrl: image ?? "",
      fit: fit ?? BoxFit.cover,
      width: double.infinity,
      progressIndicatorBuilder: (context, child, progress) {
        return showShimmer
            ? shimmer()
            : Container(
                alignment: Alignment.center,
                color: backgroundColor ?? AppPalettes.liteGreyColor,
                child: placeholder,
              );
      },
      errorWidget: (context, error, stackTrace) {
        return Container(
          alignment: Alignment.center,
          color: backgroundColor ?? AppPalettes.liteGreyColor,
          child: placeholder ?? SizedBox.shrink(),
        );
      },
    );
  }

  static Widget buildNetworkIcons({
    required String path,
    double? iconSize,
    Function()? onTap,
    Color? color,
    double? radius,
  }) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: iconSize,
        height: iconSize,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(radius ?? 0),
          child: getCacheNetworkImage(path, fit: BoxFit.contain),
        ),
      ),
    );
  }

  static String getInitials(String name) {
    return name
        .split(" ")
        .where((word) => word.isNotEmpty)
        .take(2)
        .map((word) => word[0])
        .join()
        .toUpperCase();
  }

  static Widget buildChip(
    String status, {
    Color? color,
    TextStyle? style,
    double? radius,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.allPaddingX3,
        vertical: Dimens.allPaddingX1,
      ),
      decoration: boxDecorationRoundedWithShadow(
        radius ?? Dimens.radius100,
        backgroundColor: color ?? AppPalettes.whiteColor,
      ),
      child: Text(status.replaceAll('_', ' ').toUpperCase(), style: style),
    );
  }

  static Color autoLessonColor(String? subject, bool isDark) {
    if (subject == null) {
      return AppPalettes.greyColor.withOpacityExt(isDark ? 0.55 : 0.2);
    }
    int hash = 0;
    for (int i = 0; i < subject.length; i++) {
      hash = (hash + subject.codeUnitAt(i)) % 360;
    }
    final hsl = HSLColor.fromAHSL(
      1.0,
      hash.toDouble(),
      0.6,
      isDark ? 0.55 : 0.85,
    );
    return hsl.toColor();
  }
}
