import 'package:homeservice/core/extensions/context_extension.dart';
import 'package:homeservice/core/extensions/padding_extension.dart';
import 'package:homeservice/core/helpers/decoration.dart';
import 'package:homeservice/core/routes/route_exports.dart';
import 'package:homeservice/core/utils/app_palettes.dart';
import 'package:homeservice/core/utils/dimens.dart';
import 'package:homeservice/core/utils/sizedBox.dart';
import 'package:homeservice/features/category/domain/entities/category_entity.dart';
import 'package:homeservice/features/service/presentation/components/horizontal_carousel_slider.dart';

class CategoryCardHeader extends StatelessWidget {
  final double padding;
  final CategoryEntity? category;
  const CategoryCardHeader({
    super.key,
    required this.category,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final cardColor = context.cardColor;
    return ColoredBox(
      color: context.primaryColorMode,
      child: Column(
        crossAxisAlignment: .start,
        spacing: Dimens.gapX3,
        children: [
          HorizontalCarouselSlider(images: category?.assets ?? []),
          Column(
            crossAxisAlignment: .start,
            spacing: Dimens.gapX1,
            children: [
              FittedBox(
                child: Text(
                  category?.name ?? "",
                  style: textTheme.headlineLarge,
                ),
              ).horizontalPadding(padding),
              Row(
                crossAxisAlignment: .center,
                spacing: Dimens.gapX1,
                children: [
                  Icon(Icons.star, size: textTheme.bodyLarge?.fontSize),

                  Row(
                    children: [
                      Text(
                        category?.ratings.toString() ?? "",
                        style: textTheme.bodyLarge?.copyWith(fontWeight: .w600),
                      ),
                      Text(
                        " (${category?.bookings} bookings) ",
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppPalettes.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ).horizontalPadding(padding),
            ],
          ),

          Container(
            margin: .symmetric(horizontal: padding),
            padding: .symmetric(
              horizontal: Dimens.horPaddingX4,
              vertical: Dimens.verPaddingX3,
            ),
            decoration: boxDecorationRoundedWithShadow(
              Dimens.radiusX2,
              backgroundColor: cardColor,
            ),
            child: Column(
              crossAxisAlignment: .start,
              spacing: Dimens.gapX1,
              children: [
                Row(
                  spacing: Dimens.gapX2,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: AppPalettes.checkColor,
                      size: textTheme.bodyLarge?.fontSize,
                    ),
                    Text(
                      "PREMIUM COVER",
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: .w600,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Upto 30 days warrenty on repairs",
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: .w400,
                    color: AppPalettes.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          SizeBox.sizeHX2,
        ],
      ),
    );
  }
}
