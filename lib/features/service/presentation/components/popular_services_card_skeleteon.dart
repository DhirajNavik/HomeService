import 'package:flutter/material.dart';
import 'package:homeservice/core/extensions/padding_extension.dart';
import 'package:homeservice/core/helpers/common_helpers.dart';
import 'package:homeservice/core/utils/app_palettes.dart';
import 'package:homeservice/core/utils/dimens.dart';
import 'package:homeservice/core/utils/sizedBox.dart';

class PopularServicesCardSkeleton extends StatelessWidget {
  const PopularServicesCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonHelpers.shimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Dimens.gapX2,
        children: [
          _box(width: Dimens.screenWidth * 0.55, height: 30),

          SizedBox(
            height: 150,
            child: ListView.separated(
              padding: .zero,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (_, _) => SizeBox.sizeWX2,
              itemBuilder: (_, _) {
                return Container(
                  width: Dimens.screenWidth * .85,
                  padding: .all(Dimens.horizontalspacing),
                  decoration: BoxDecoration(
                    color: AppPalettes.whiteColor,
                    borderRadius: .circular(Dimens.radiusX3),
                  ),
                );
              },
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
