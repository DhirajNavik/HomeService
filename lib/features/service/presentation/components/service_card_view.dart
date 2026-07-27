import 'package:flutter/material.dart';
import 'package:homeservice/core/components/animated_button.dart';
import 'package:homeservice/core/extensions/context_extension.dart';
import 'package:homeservice/core/helpers/common_helpers.dart';
import 'package:homeservice/core/utils/app_palettes.dart';
import 'package:homeservice/core/utils/dimens.dart';
import 'package:homeservice/features/service/domain/entities/service_entity.dart';
import 'package:homeservice/features/service/presentation/components/add_to_cart_button.dart';

class ServiceCardView extends StatelessWidget {
  final ServiceEntity service;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback? onRemove;
  const ServiceCardView({
    super.key,
    required this.service,
    required this.quantity,
    required this.onAdd,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Container(
      padding: .only(top: Dimens.verPaddingX3, bottom: Dimens.verPaddingX5),
      color: context.primaryColorMode,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              spacing: Dimens.gapX1,
              children: [
                Text(service.name ?? "", style: textTheme.headlineSmall),

                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "₹${service.finalPrice?.round().toString()}  ",
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

                Text(
                  service.description.toString(),
                  style: textTheme.bodySmall?.copyWith(
                    color: AppPalettes.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            clipBehavior: .none,
            alignment: .bottomCenter,
            children: [
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
              Positioned(
                bottom: -10,
                child: SizedBox(
                  width: 80,
                  height: Dimens.addButtonHeight,
                  child: quantity == 0
                      ? CommonButton(
                          text: "Add",
                          onTap: onAdd,
                          padding: .symmetric(vertical: Dimens.verPaddingX1),
                          radius: Dimens.radiusX2,
                        )
                      : AddToCartButton(
                          onAdd: onAdd,
                          quantity: quantity.toString(),
                          onRemove: onRemove,
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
