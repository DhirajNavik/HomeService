import 'package:flutter/cupertino.dart';
import 'responsive_helper.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
  });

  @override
  Widget build(BuildContext context) {
    if (ResponsiveHelper.getDeviceType == DeviceType.desktop ||
        ResponsiveHelper.getDeviceType == DeviceType.tablet) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
