import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import '../../../../constants/constants.dart';

class SmallCardTitle extends StatelessWidget {
  const SmallCardTitle({@required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return DeviceData(
      builder: (context, device) => SizedBox(
        height: device.localWidth * .5,
        child: AutoSizeText(
          title,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
            fontWeight: FontWeight.w500,
            color: kLightTextColor,
            fontSize: device.localWidth * .12,
          ),
        ),
      ),
    );
  }
}
