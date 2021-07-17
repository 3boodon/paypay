import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
          SizedBox(
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                translate("aboutAppDesc"),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily:
                      Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
                  fontSize: 13,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.normal,
                ),
                maxLines: 10,
              ),
              SizedBox(height: device.screenHeight * .014),
              AutoSizeText(
                translate("database"),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
              ),
              SizedBox(height: device.screenHeight * .009),
              AutoSizeText(
                translate("databaseDesc"),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily:
                      Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
                  fontSize: 13,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.normal,
                ),
                maxLines: 10,
              ),
            ],
          ),
        ],
      );
    });
  }
}
