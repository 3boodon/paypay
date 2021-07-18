import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import '../../../../constants/constants.dart';

class NewButton extends StatelessWidget {
  const NewButton({@required this.onPressed, this.width, this.height});
  final double width;
  final double height;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: DeviceData(
        builder: (context, device) => Container(
          width: width,
          height: height,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) => Center(
              child: AutoSizeText(
                Constants.appLanguageCode == "ar"
                    ? translate("addNew")
                    : translate("add"),
                style: TextStyle(
                  fontFamily:
                      Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
                  fontWeight: FontWeight.bold,
                  color: kDarkTextColor,
                  fontSize: Constants.appLanguageCode == "ar"
                      ? constraints.maxWidth * .16
                      : constraints.maxWidth * .18,
                ),
                maxLines: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
