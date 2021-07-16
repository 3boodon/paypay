import 'package:flutter/cupertino.dart';
import 'package:paypay/FrontEnd/responsive/enums/device_types.dart';

/// This Method is checking the width to Detect the device Type
DeviceType getDeviceType(MediaQueryData mediaQueryData) {
  double screenWidth = 0;

  /// Here we Are checking the Device Orientation
  if (mediaQueryData.orientation == Orientation.landscape) {
    screenWidth = mediaQueryData.size.height;
  } else {
    screenWidth = mediaQueryData.size.width;
  }

  /// Here We Are Checking the Width
  if (screenWidth >= 950) {
    return DeviceType.Desktop;
  } else if (screenWidth >= 600) {
    return DeviceType.Tablet;
  } else {
    return DeviceType.Phone;
  }
}
