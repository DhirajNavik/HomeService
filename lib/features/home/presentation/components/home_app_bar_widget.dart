import 'package:flutter/material.dart';
import 'package:homeservice/core/extensions/context_extension.dart';
import 'package:homeservice/core/extensions/padding_extension.dart';
import 'package:homeservice/core/extensions/responsive_extension.dart';
import 'package:homeservice/core/helpers/common_helpers.dart';
import 'package:homeservice/core/utils/app_images.dart';
import 'package:homeservice/core/utils/app_palettes.dart';
import 'package:homeservice/core/utils/dimens.dart';
import 'package:homeservice/features/home/domain/entities/location_entity.dart';

class HomeAppBarWidget extends StatefulWidget {
  final LocationEntity? location;
  const HomeAppBarWidget({super.key, required this.location});

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

      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        collapseMode: CollapseMode.parallax,
        centerTitle: false,
        titlePadding: EdgeInsets.symmetric(horizontal: Dimens.horPaddingX4),

        background: Stack(
          children: [
            Column(
              crossAxisAlignment: .start,
              spacing: Dimens.gapX1,
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
            ).onlyPadding(left: Dimens.horPaddingX4, top: Dimens.verPaddingX5),

            Column(
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
          ],
        ),
        title: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentGeometry.centerRight,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Dimens.gapX,
              children: [
                Row(
                  spacing: Dimens.gapX1,
                  crossAxisAlignment: .end,
                  children: [
                    CommonHelpers.buildIcons(
                      path: AppImages.locationIcon,
                      iconSize: Dimens.scaleX3,
                      iconColor: AppPalettes.whiteColor,
                    ),
                    Text(
                      widget.location?.city ?? "Loading...",
                      style: textTheme.titleMedium?.copyWith(
                        color: AppPalettes.whiteColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  "  ${widget.location?.state??""}",
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppPalettes.whiteColor,
                    fontWeight: .w600,
                  ),
                ),
              ],
            ).onlyPadding(bottom: Dimens.horPaddingX4),
            Padding(
              padding: EdgeInsetsGeometry.only(
                top: Dimens.verPaddingX3,
                right: Dimens.horPaddingX2,
              ),
              child: Image.asset(AppImages.userIcon, height: Dimens.scaleX6),
            ),
          ],
        ),
      ),
    );
  }
}
