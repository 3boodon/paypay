import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import 'package:paypay/FrontEnd/widgets/header.dart';
import 'package:paypay/FrontEnd/widgets/new_page.dart';

class AboutScreen extends StatelessWidget {
  static String routeName = '/AboutScreen';
  const AboutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeviceData(builder: (context, device) {
      return NewPage(
        children: [
          Header(
            title: "About",
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "About PayPay",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
              ),
              SizedBox(height: device.screenHeight * .009),
              AutoSizeText(
                "PayPay is a money management app that will help you orgnaize your financial stuff and make it a lot easier.\nCurrently the app is still being developed which means that this version of the app is just a beta version for getting user's feedbacks and collecting more ideas about how we can make it more effecient and more helpful.",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.normal,
                ),
                maxLines: 10,
              ),
              SizedBox(height: device.screenHeight * .014),
              AutoSizeText(
                "DATABASE",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
              ),
              SizedBox(height: device.screenHeight * .009),
              AutoSizeText(
                "We are using the local storage on your phone to save your data, so if you uninstall the app your data will be lost.\n Hopefully in the next version, database will be available online  in order for you to have a better expereince.",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
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
