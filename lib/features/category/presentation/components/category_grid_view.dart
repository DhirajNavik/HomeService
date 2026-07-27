import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homeservice/config/injector/injector_config.dart';
import 'package:homeservice/core/extensions/context_extension.dart';
import 'package:homeservice/core/extensions/padding_extension.dart';
import 'package:homeservice/core/extensions/responsive_extension.dart';
import 'package:homeservice/core/helpers/common_helpers.dart';
import 'package:homeservice/core/routes/route_exports.dart';
import 'package:homeservice/core/utils/dimens.dart';
import 'package:homeservice/core/utils/sizedBox.dart';
import 'package:homeservice/features/category/domain/entities/category_entity.dart';
import 'package:homeservice/features/category/presentation/components/category_list_view.dart';

class CategoryGridView extends StatelessWidget {
  final List<CategoryEntity> categories;
  const CategoryGridView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final responsiveCount = max(1, (Dimens.screenWidth ~/ 76.width()).toInt());
    final itemsToShow = min(categories.length, (responsiveCount * 2) - 1);
    final customCategory = categories.take(itemsToShow).toList();
    final showViewMore = categories.length > itemsToShow;
    final textTheme = context.textTheme;
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .max,
      spacing: Dimens.gapX2,
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                "What are you looking for Today?",
                style: textTheme.titleLarge?.copyWith(fontWeight: .w600),
              ),
            ),
          ],
        ),
        Wrap(
          alignment: .start,
          crossAxisAlignment: .start,
          spacing: Dimens.gapX3,
          runSpacing: Dimens.gapX3,
          children: [
            ...List.generate(customCategory.length, (index) {
              final category = customCategory[index];

              return Column(
                children: [
                  CommonHelpers.buildNetworkIcons(
                    onTap: () {
                      serviceLocater<GoRouter>().pushNamed(
                        AppRoute.categoryDetails.pathName,
                        pathParameters: {'id': category.id},
                      );
                    },
                    iconSize: Dimens.screenWidth / responsiveCount * 0.77,
                    radius: Dimens.radiusX2,
                    path: category.icon.toString(),
                  ),
                  SizeBox.sizeHX2,
                  SizedBox(
                    width: Dimens.scaleX8,
                    child: Text(
                      category.name ?? "Invalid",
                      style: textTheme.bodySmall?.copyWith(fontWeight: .w500),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ),
                ],
              );
            }),
            if (showViewMore)
              ViewMoreCategory(
                data: categories,
                size: Dimens.screenWidth / responsiveCount * 0.77,
              ),
          ],
        ),
      ],
    ).symmetricPadding(horizontal: Dimens.horizontalspacing);
  }
}
