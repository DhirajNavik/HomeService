import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homeservice/config/injector/injector_config.dart';
import 'package:homeservice/core/components/animated_button.dart';
import 'package:homeservice/core/extensions/context_extension.dart';
import 'package:homeservice/core/routes/app_route_path.dart';
import 'package:homeservice/core/utils/app_palettes.dart';
import 'package:homeservice/core/utils/dimens.dart';

class CartBottomBar extends StatelessWidget {
  final double total;
  const CartBottomBar({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return SafeArea(
      child: Container(
        height: 80,
        padding: .symmetric(horizontal: Dimens.horPaddingX5),
        decoration: BoxDecoration(
          color: context.cardColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimens.radiusX5),
          ),
          boxShadow: [
            BoxShadow(blurRadius: 20, color: AppPalettes.shadowColor),
          ],
        ),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              children: [
                Text(
                  "₹${total.toStringAsFixed(2)}",
                  style: textTheme.displayMedium?.copyWith(fontWeight: .w700),
                ),
                Text(
                  "Total",
                  style: textTheme.bodyMedium?.copyWith(fontWeight: .w600),
                ),
              ],
            ),

            CommonButton(
              text: "Place Order",
              onTap: () => serviceLocater<GoRouter>().push(AppRoute.bookingConfirmation.path),
              padding: .symmetric(
                horizontal: Dimens.horPaddingX5,
                vertical: Dimens.verPaddingX3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
