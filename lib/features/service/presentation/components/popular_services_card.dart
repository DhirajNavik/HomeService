import 'package:homeservice/config/injector/injector_config.dart';
import 'package:homeservice/core/extensions/context_extension.dart';
import 'package:homeservice/core/extensions/padding_extension.dart';
import 'package:homeservice/core/helpers/common_helpers.dart';
import 'package:homeservice/core/helpers/decoration.dart';
import 'package:homeservice/core/routes/route_exports.dart';
import 'package:homeservice/core/utils/app_palettes.dart';
import 'package:homeservice/core/utils/dimens.dart';
import 'package:homeservice/core/utils/sizedBox.dart';
import 'package:homeservice/features/service/domain/entities/service_entity.dart';

class PopularServicesCard extends StatelessWidget {
  final List<ServiceEntity> services;
  const PopularServicesCard({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
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
                "Top Rated Services",
                style: textTheme.titleLarge?.copyWith(fontWeight: .w600),
              ),
            ),
          ],
        ).horizontalPadding(Dimens.horizontalspacing),
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: .horizontal,
            itemCount: services.length,
            separatorBuilder: (_, _) => SizeBox.sizeWX2,
            padding: .symmetric(horizontal: Dimens.horizontalspacing),
            itemBuilder: (context, index) {
              final service = services[index];
              return InkWell(
                overlayColor: const WidgetStatePropertyAll(
                  AppPalettes.transparentColor,
                ),
                onTap: () {
                  serviceLocater<GoRouter>().pushNamed(
                    AppRoute.categoryDetails.pathName,
                    pathParameters: {'id': service.category.toString()},
                  );
                },
                child: Container(
                  padding: .all(Dimens.allPaddingX4),
                  decoration: boxDecorationRoundedWithShadow(
                    Dimens.radiusX3,
                    backgroundColor: context.cardColor,
                  ),
                  child: Row(
                    crossAxisAlignment: .start,
                    children: [
                      Column(
                        crossAxisAlignment: .start,
                        spacing: Dimens.gapX1,
                        children: [
                          Text(
                            service.name ?? "",
                            style: textTheme.headlineSmall,
                          ),

                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "₹${service.finalPrice?.round().toString()}  ",
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontWeight: .w700,
                                  ),
                                ),
                                TextSpan(
                                  text: "₹${service.price?.round().toString()}",
                                  style: textTheme.bodySmall?.copyWith(
                                    fontWeight: .w400,
                                    decoration: .lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Row(
                            spacing: Dimens.gapX1,
                            crossAxisAlignment: .end,
                            children: [
                              Icon(
                                Icons.discount_rounded,
                                size: textTheme.bodyMedium?.fontSize,
                                color: AppPalettes.checkColor,
                              ),
                              Text(
                                "₹${(service.price ?? 0) - (service.finalPrice ?? 0).round()} Off",
                                style: textTheme.bodyMedium?.copyWith(
                                  color: AppPalettes.checkColor,
                                  fontWeight: .w400,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            width: Dimens.screenHalfWidth,
                            child: Text(
                              service.description.toString(),
                              style: textTheme.bodySmall?.copyWith(
                                color: AppPalettes.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: .circular(Dimens.radiusX2),
                          child: CommonHelpers.getCacheNetworkImage(
                            service.assets ?? "",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
