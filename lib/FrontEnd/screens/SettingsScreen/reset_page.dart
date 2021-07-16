import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/BackEnd/services/models_services.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import 'package:paypay/FrontEnd/screens/WelcomeScreen/welcome_screen.dart';
import 'package:paypay/FrontEnd/widgets/buttons.dart';
import 'package:paypay/FrontEnd/widgets/header.dart';
import 'package:paypay/FrontEnd/widgets/new_page.dart';

class ResetPage extends StatelessWidget {
  static String routeName = '/ResetScreen';

  const ResetPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeviceData(
      builder: (_, device) => NewPage(
        children: [
          Header(
            title: "reset App",
          ),
          SizedBox(height: device.screenWidth * 0.10),
          Column(
            children: [
              AutoSizeText(
                "If you wanna reset your data to start all over again just press on this button below and all data will be cleared.",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.normal,
                ),
                maxLines: 10,
              ),
              SizedBox(height: device.screenWidth * 0.10),
              Button(
                text: "Reset",
                width: device.screenWidth * .6,
                onPressed: () {
                  UserData s = UserData.fromJSON(Map<String, dynamic>.from(
                      Hive.box(userDataBoxName).get(userDataKeyName)));
                  s.loggedIn = false;
                  ModelsService().saveUserDataToHive(s);
                  Hive.box(purchaseBoxName).clear();
                  Hive.box(spendingBoxName).clear();
                  Hive.box(debtBoxName).clear();
                  Get.offNamed(WelcomeScreen.routeName);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
