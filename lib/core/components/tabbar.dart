import '../helpers/decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../extensions/context_extension.dart';
import '../utils/app_palettes.dart';
import '../utils/dimens.dart';

class CommonTabBar extends StatelessWidget {
  final TabController controller;
  final double commonRadius;
  final double? height;
  final double? fontSize;
  final List<String> tabLabels;
  final TabBarIndicatorSize? tabBarSize;
  final Color? unSelectedTabColor;
  final TabAlignment? alignment;
  final EdgeInsets? padding;

  const CommonTabBar({
    required this.controller,
    required this.tabLabels,
    this.height,
    this.fontSize,
    this.commonRadius = 28,
    super.key,
    this.tabBarSize = TabBarIndicatorSize.label,
    this.alignment,
    this.unSelectedTabColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return TabBar(
      splashFactory: NoSplash.splashFactory,
      overlayColor: WidgetStatePropertyAll(AppPalettes.transparentColor),
      controller: controller,
      labelStyle: textTheme.bodyMedium?.copyWith(
        color: AppPalettes.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: textTheme.bodyMedium?.copyWith(
        color: AppPalettes.greyColor,
        fontWeight: FontWeight.w500,
      ),
      isScrollable: false,
      padding: padding,
      labelPadding: EdgeInsetsGeometry.zero,
      indicatorPadding: EdgeInsetsGeometry.zero,
      dividerHeight: 0,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: boxDecorationRoundedWithShadow(
        Dimens.radiusX2,
        disableBottomRadius: true,
        border: Border(
          bottom: BorderSide(width: 1.spMax, color: AppPalettes.primaryColor),
        ),
        shadowColor: AppPalettes.shadowColor,
        spreadRadius: 2,
      ),

      tabs: tabLabels.asMap().entries.map((entry) {
        return Padding(
          padding: REdgeInsets.symmetric(
            horizontal: Dimens.allPaddingX2,
            vertical: Dimens.allPaddingX4,
          ),
          child: Text(
            entry.value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }
}
