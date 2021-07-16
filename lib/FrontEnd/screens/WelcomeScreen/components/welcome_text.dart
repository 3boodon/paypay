import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import '../../../../FrontEnd/constants/constants.dart';

class WelcomeScreenText extends StatelessWidget {
  const WelcomeScreenText();
  @override
  Widget build(BuildContext context) {
    return DeviceData(
      builder: (_, device) => Container(
        child: Column(
          children: [
            AutoSizeText(
              "Welcome",
              maxLines: 1,
              style: TextStyle(
                color: kLightTextColor,
                fontWeight: FontWeight.w700,
                fontSize: device.screenWidth * .13,
              ),
            ),
            AutoSizeText(
              "Welcome to the beta version of PayPay App, we hope\nwe can make your life much\nmore organized",
              maxLines: 4,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kLightTextColor,
                fontWeight: FontWeight.w300,
                fontSize: device.screenWidth * .04,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
