import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';

import 'package:paypay/FrontEnd/widgets/header.dart';
import 'package:paypay/FrontEnd/widgets/new_page.dart';

import '../../constants/constants.dart';

class LanguageScreen extends StatelessWidget {
  static String routeName = '/LanguageScreen';

  LanguageScreen();

  @override
  Widget build(BuildContext context) {
    return DeviceData(
      builder: (_, device) => NewPage(
        children: [
          Header(
            title: translate("lang"),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: device.screenHeight * .02),
                  AutoSizeText(
                    translate("langChangeDesc"),
                    overflow: TextOverflow.ellipsis,
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: Constants.appLanguageCode == "ar"
                          ? "GE_SS"
                          : "Poppins",
                      fontSize: Constants.appLanguageCode == "ar" ? 15 : 11,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.normal,
                    ),
                    maxLines: 10,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
