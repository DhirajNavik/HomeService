import 'package:flutter/material.dart';
import 'package:homeservice/core/extensions/context_extension.dart';
import 'package:homeservice/core/extensions/responsive_extension.dart';
import 'package:homeservice/core/utils/app_images.dart';
import 'package:homeservice/core/utils/app_palettes.dart';
import 'package:homeservice/core/utils/dimens.dart';

class HomeAppBarWidget extends StatefulWidget {
  final bool isScrolled;
  const HomeAppBarWidget({super.key, required this.isScrolled});

  @override
  State<HomeAppBarWidget> createState() => _HomeAppBarWidgetState();
}

class _HomeAppBarWidgetState extends State<HomeAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return SliverAppBar(
      backgroundColor: AppPalettes.primaryColor,
      pinned: true,
      expandedHeight: 150.height(),
      collapsedHeight: 100.height(),
      floating: true,
      snap: true,
      stretch: true,
      surfaceTintColor: AppPalettes.transparentColor,
      clipBehavior: Clip.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          bottomLeft: Radius.circular(Dimens.radiusX8),
          bottomRight: Radius.circular(Dimens.radiusX8),
        ),
      ),
      title: AnimatedOpacity(
        opacity: widget.isScrolled ? 1 : 0,
        duration: Duration(milliseconds: 60),
        child: Text("Hello, User!", style: textTheme.headlineSmall),
      ),
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        collapseMode: CollapseMode.parallax,
        centerTitle: false,
        titlePadding: EdgeInsets.symmetric(horizontal: Dimens.horPaddingX4),

        background: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Spacer(flex: 3),
                Image.asset(
                  AppImages.fastIcon,
                  height: Dimens.scaleX4,
                  color: AppPalettes.iconColor,
                ),
                Spacer(flex: 1),
              ],
            ),
            Row(
              children: [
                Spacer(flex: 3),
                Image.asset(
                  AppImages.allDayIcon,
                  height: Dimens.scaleX4,
                  color: AppPalettes.iconColor,
                ),
                Spacer(flex: 2),
              ],
            ),
            Row(
              children: [
                Spacer(flex: 5),
                Image.asset(
                  AppImages.starIcon,
                  height: Dimens.scaleX3,
                  color: AppPalettes.iconColor,
                ),
                Spacer(flex: 1),
              ],
            ),
          ],
        ),
        title: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentGeometry.centerRight,
          children: [
            AnimatedOpacity(
              opacity: widget.isScrolled ? 0 : 1,
              duration: Duration(milliseconds: 100),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: Dimens.gapX,
                    children: [
                      Text("Hello, User!", style: textTheme.headlineLarge),
                      Text(
                        " Welcome Back",
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppPalettes.whiteColor,
                          fontWeight: .w500,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AnimatedPadding(
              duration: Duration(milliseconds: 100),
              padding: widget.isScrolled
                  ? EdgeInsetsGeometry.only(top: Dimens.allPaddingX6)
                  : EdgeInsetsGeometry.zero,
              child: Image.asset(AppImages.userIcon, height: Dimens.scaleX6),
            ),
          ],
        ),
      ),
    );
  }
}
