import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import '../constants/constants.dart';

class Button extends StatelessWidget {
  const Button({
    @required this.text,
    @required this.onPressed,
    this.width,
    this.color,
  });
  final double width;
  final String text;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: DeviceData(
        builder: (_, device) => Container(
          width: width,
          child: AspectRatio(
            aspectRatio: 213 / 55,
            child: Container(
              decoration: BoxDecoration(
                color: color ?? kPrimaryColor,
                borderRadius: BorderRadius.circular(device.localWidth * .06),
              ),
              child: Center(
                child: AutoSizeText(
                  text,
                  style: TextStyle(
                    fontFamily:
                        Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
                    color: kLightTextColor,
                    fontSize: Constants.appLanguageCode == "ar"
                        ? device.localWidth * .07
                        : device.localWidth * .07,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OutLinedButton extends StatelessWidget {
  const OutLinedButton({
    @required this.text,
    @required this.onPressed,
  });

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AspectRatio(
        aspectRatio: 213 / 55,
        child: DeviceData(
          builder: (_, device) => Container(
            decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor, width: 2),
              borderRadius: BorderRadius.circular(device.localWidth * .06),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontFamily:
                      Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
                  color: kPrimaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
