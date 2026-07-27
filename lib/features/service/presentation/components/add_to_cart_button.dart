import 'package:flutter/material.dart';
import 'package:homeservice/core/extensions/context_extension.dart';
import 'package:homeservice/core/utils/app_palettes.dart';
import 'package:homeservice/core/utils/dimens.dart';

class AddToCartButton extends StatelessWidget {
  final String quantity;
  final VoidCallback onAdd;
  final VoidCallback? onRemove;
  const AddToCartButton({
    super.key,
    required this.onAdd,
    this.onRemove,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme.bodyMedium;
    return Container(
      decoration: BoxDecoration(
        color: AppPalettes.whiteColor,
        borderRadius: BorderRadius.circular(Dimens.radiusX2),
        border: Border.all(color: context.primaryColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: onRemove,
            child: Icon(Icons.remove, size: textTheme?.fontSize),
          ),
          Text(
            quantity,
            style: textTheme?.copyWith(fontWeight: FontWeight.w600),
          ),
          InkWell(onTap: onAdd, child:  Icon(Icons.add, size: textTheme?.fontSize)),
        ],
      ),
    );
  }
}
