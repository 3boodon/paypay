import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';

class PlusIcon extends StatelessWidget {
  const PlusIcon({this.width, this.height, this.color});
  final double width;
  final double height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    print(width / height);
    return DeviceData(
      builder: (context, device) => AspectRatio(
        aspectRatio: width / height,
        // aspectRatio: 57 / 44,
        child: SizedBox(
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: (width - device.localWidth * .53) / 2,
                child: SvgPicture.asset(
                  "assets/icons/plus_icon.svg",
                  width: device.localWidth * .53,
                  color: color,
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: SvgPicture.asset(
                  "assets/icons/plus_icon.svg",
                  width: device.localWidth * .23,
                  color: color.withOpacity(0.3),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: SvgPicture.asset(
                  "assets/icons/plus_icon.svg",
                  width: device.localWidth * .23,
                  color: color.withOpacity(0.3),
                ),
              ),
              Positioned(
                left: 7,
                top: device.localHeight * .25,
                child: SvgPicture.asset(
                  "assets/icons/plus_icon.svg",
                  width: device.localWidth * .20,
                  color: color.withOpacity(0.1),
                ),
              ),
              Positioned(
                right: 7,
                top: device.localHeight * .25,
                child: SvgPicture.asset(
                  "assets/icons/plus_icon.svg",
                  width: device.localWidth * .20,
                  color: color.withOpacity(0.1),
                ),
              ),
              Positioned(
                right: (width - device.localWidth * .20) / 2,
                left: (width - device.localWidth * .20) / 2,
                top: 0,
                child: SvgPicture.asset(
                  "assets/icons/plus_icon.svg",
                  width: device.localWidth * .20,
                  color: color.withOpacity(0.05),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
