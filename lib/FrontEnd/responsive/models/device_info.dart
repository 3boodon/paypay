import 'package:flutter/cupertino.dart';
import 'package:paypay/FrontEnd/responsive/enums/device_types.dart';

/// This Model is to store Device Info
class DeviceInfo {
  final Orientation orientation;
  final DeviceType deviceType;
  final double screenWidth;
  final double screenHeight;
  final double localWidth;
  final double localHeight;

  DeviceInfo({
    this.orientation,
    this.deviceType,
    this.screenWidth,
    this.screenHeight,
    this.localWidth,
    this.localHeight,
  });
}
