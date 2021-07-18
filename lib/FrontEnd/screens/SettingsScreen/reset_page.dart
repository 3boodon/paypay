import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/BackEnd/services/models_services.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import 'package:paypay/FrontEnd/screens/WelcomeScreen/welcome_screen.dart';
import 'package:paypay/FrontEnd/widgets/buttons.dart';
import 'package:paypay/FrontEnd/widgets/header.dart';
import 'package:paypay/FrontEnd/widgets/new_page.dart';

import '../../constants/constants.dart';

class ResetPage extends StatelessWidget {
  static String routeName = '/ResetScreen';

  const ResetPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeviceData(
      builder: (_, device) => NewPage(
        children: [
          Header(
            title: translate("resetData"),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: device.screenHeight * .02),
                  AutoSizeText(
                    translate("resetDatadesc"),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
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
                  Spacer(
                    flex: 12,
                  ),
                  Button(
                    text: translate("resetData"),
                    width: device.screenWidth * .6,
                    color: Colors.redAccent,
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
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
