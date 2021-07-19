import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
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
              translate("welcome"),
              maxLines: 1,
              style: TextStyle(
                fontFamily:
                    Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
                color: kLightTextColor,
                fontWeight: FontWeight.w700,
                fontSize: device.screenWidth * .13,
              ),
            ),
            AutoSizeText(
              Constants.appLanguageCode == "ar"
                  ? "${translate("welcome_desc1")} PayPay, ${translate("welcome_desc2")}"
                  : "${translate("welcome_desc2")}",
              maxLines: 4,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily:
                    Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
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
