import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import 'package:paypay/FrontEnd/widgets/header.dart';
import 'package:paypay/FrontEnd/widgets/new_page.dart';

import '../../constants/constants.dart';

class AboutScreen extends StatelessWidget {
  static String routeName = '/AboutScreen';
  const AboutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeviceData(builder: (context, device) {
      return NewPage(
        children: [
          Header(
            title: translate("aboutTheApp"),
          ),
          Container(
            height: device.screenHeight * .65,
            padding:
                EdgeInsets.symmetric(horizontal: device.screenWidth * .021),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Image.asset(
                  "assets/images/ic_launcher.png",
                  height: device.screenWidth * .5,
                ),
                AutoSizeText(
                  "PayPay",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    height: .1,
                    color: kDarkTextColor,
                    fontFamily:
                        Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                SizedBox(height: device.screenHeight * .02),
                AutoSizeText(
                  translate("aboutAppDesc"),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    height: 1.4,
                    fontFamily:
                        Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
                    fontSize: Constants.appLanguageCode == "ar" ? 15 : 11,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.normal,
                  ),
                  maxLines: 20,
                ),
                SizedBox(height: device.screenHeight * .02),
                AutoSizeText(
                  translate("database"),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Constants.appLanguageCode == "ar" ? 21 : 20,
                    color: kDarkTextColor,
                    fontFamily:
                        Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                SizedBox(height: device.screenHeight * .009),
                AutoSizeText(
                  translate("databaseDesc"),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    height: 1.4,
                    fontFamily:
                        Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
                    fontSize: Constants.appLanguageCode == "ar" ? 15 : 11,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.normal,
                  ),
                  maxLines: 20,
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
