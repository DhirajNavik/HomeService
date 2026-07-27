import 'package:flutter/material.dart';
import 'package:homeservice/core/components/animated_button.dart';
import 'package:homeservice/core/extensions/context_extension.dart';
import 'package:homeservice/core/extensions/padding_extension.dart';
import 'package:homeservice/core/routes/app_route_conf.dart';
import 'package:homeservice/core/utils/app_images.dart';
import 'package:homeservice/core/utils/dimens.dart';
import 'package:homeservice/core/utils/sizedBox.dart';

class EmptyPageWidget extends StatelessWidget {
  const EmptyPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: .max,
      spacing: Dimens.widgetSpacing,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 100, maxHeight: 200),
          child: Image.asset(AppImages.emptyCartIcon, fit: BoxFit.contain),
        ),
        Text('Its Empty here', style: textTheme.headlineSmall),
        CommonButton(
          padding: .symmetric(
            horizontal: Dimens.horPaddingX5,
            vertical: Dimens.verPaddingX3,
          ),
          text: 'Explore Services',
          onTap: () {
            AppRouteConf.rootNavigatorKey.currentState?.popUntil(
              (route) => route.isFirst,
            );
          },
        ).symmetricPadding(horizontal: Dimens.horizontalspacing),
        SizeBox.sizeHX10,
      ],
    );
  }
}
