import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import 'package:paypay/FrontEnd/widgets/header.dart';
import 'package:paypay/FrontEnd/widgets/new_page.dart';

import '../../constants/constants.dart';

class GuidesScreen extends StatelessWidget {
  static String routeName = '/GuidesScreen';
  const GuidesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeviceData(builder: (context, device) {
      return NewPage(
        children: [
          Header(
            title: translate("guides"),
          ),
          Container(
            height: device.screenHeight * .65,
            padding:
                EdgeInsets.symmetric(horizontal: device.screenWidth * .021),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                AutoSizeText(
                  translate("AppGuidesDesc"),
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
                  translate("incomeCard"),
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
                  translate("incomeCardDesc"),
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
                  translate("spendingCard"),
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
                  translate("spendingCardDesc"),
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
                  translate("debtCard"),
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
                  translate("debtCardDesc"),
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
