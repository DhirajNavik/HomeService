import 'dart:math';
import 'package:flutter/material.dart';
import 'package:homeservice/core/extensions/padding_extension.dart';
import 'package:homeservice/core/extensions/responsive_extension.dart';
import 'package:homeservice/core/helpers/common_helpers.dart';
import 'package:homeservice/core/utils/dimens.dart';

class CategoryGridSkeleton extends StatelessWidget {
  const CategoryGridSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final responsiveCount = max(1, (Dimens.screenWidth ~/ 76.width()).toInt());
    final itemSize = Dimens.screenWidth / responsiveCount * 0.77;

    return CommonHelpers.shimmer(
      child: Column(
        crossAxisAlignment: .start,
        spacing: Dimens.gapX2,
        children: [
          _box(width: Dimens.screenWidth * 0.6, height: 30.height()),
          Wrap(
            spacing: Dimens.gapX3,
            runSpacing: Dimens.gapX3,
            children: List.generate(
              responsiveCount * 2,
              (_) => Column(
                children: [
                  _box(
                    width: itemSize,
                    height: itemSize,
                    radius: Dimens.radiusX2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ).symmetricPadding(horizontal: Dimens.horizontalspacing),
    );
  }

  Widget _box({
    required double width,
    required double height,
    double radius = 8,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
