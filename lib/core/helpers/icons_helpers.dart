import 'package:flutter/material.dart';
import 'common_helpers.dart';
import '../utils/dimens.dart';

class IconsHelpers {
  static Widget eyeIcon(String path,{ VoidCallback? onTap}) {
    return CommonHelpers.buildIcons(
      path: path,
      onTap: onTap,
      iconSize: Dimens.scaleX3,
      padding: EdgeInsets.only(
        left: Dimens.allPaddingX4,
        right: Dimens.allPaddingX1B,
      ),
    );
  }
}
