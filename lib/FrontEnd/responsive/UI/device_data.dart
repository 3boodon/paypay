import 'package:flutter/material.dart';
import 'package:paypay/FrontEnd/responsive/functions/get_device_type.dart';
import 'package:paypay/FrontEnd/responsive/models/device_info.dart';

/// This Widget is gonna be used as a parent for any widget to make it easier
/// for us to reach the device info
class DeviceData extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceInfo deviceInfo) builder;

  const DeviceData({Key key, this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      MediaQueryData mediaQueryData = MediaQuery.of(context);
      DeviceInfo deviceInfo = DeviceInfo(
        orientation: mediaQueryData.orientation,
        deviceType: getDeviceType(mediaQueryData),
        screenHeight: mediaQueryData.size.height,
        screenWidth: mediaQueryData.size.width,
        localHeight: constraints.maxHeight,
        localWidth: constraints.maxWidth,
      );

      print(
          "aspect ratio is ${deviceInfo.screenWidth / deviceInfo.screenHeight}");

      return builder(context, deviceInfo);
    });
  }
}
