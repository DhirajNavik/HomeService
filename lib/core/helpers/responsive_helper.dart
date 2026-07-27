import 'package:flutter_screenutil/flutter_screenutil.dart';

enum DeviceType { mobile, tablet, desktop }

class ResponsiveHelper {
  ResponsiveHelper._();
  static DeviceType _getDeviceType() {
    return switch (1.sw) {
      >= 1200 => DeviceType.desktop,
      >= 500 => DeviceType.tablet,
      _ => DeviceType.mobile,
    };
  }

  static DeviceType get getDeviceType => _getDeviceType();

  static int getGridResponsive(int desktop, int tablet, int mobile) {
    return switch (_getDeviceType()) {
      DeviceType.desktop => desktop,
      DeviceType.tablet => tablet,
      DeviceType.mobile => mobile,
    };
  }
}
