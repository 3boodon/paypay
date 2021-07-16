import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/BackEnd/services/models_services.dart';
import 'package:paypay/FrontEnd/constants/constants.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import 'package:paypay/FrontEnd/widgets/header.dart';
import 'package:paypay/FrontEnd/widgets/new_page.dart';
import 'package:paypay/FrontEnd/responsive/models/device_info.dart'
    as screenInfo;

class ChangeColorScreen extends StatelessWidget {
  static String routeName = '/ChangeColor';

  @override
  Widget build(BuildContext context) {
    return DeviceData(
      builder: (context, device) => NewPage(children: [
        Header(
          title: "Theme",
          date: null,
        ),
        AutoSizeText(
          "PayPay is trying to give you the best experience when using the app, that's why we provided you with four color themes to choose what works best for you.😎🙌",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            color: Colors.blueGrey,
            fontWeight: FontWeight.normal,
          ),
          maxLines: 10,
        ),
        SizedBox(height: device.screenHeight * .02),
        ColorThemeOption(device: device, colors: colors1),
        Spacer(),
        ColorThemeOption(device: device, colors: colors2),
        Spacer(),
        ColorThemeOption(device: device, colors: colors3),
        Spacer(),
        ColorThemeOption(device: device, colors: colors4),
        Spacer(
          flex: 4,
        ),
      ]),
    );
  }
}

class ColorThemeOption extends StatelessWidget {
  ColorThemeOption({this.device, this.colors});
  final screenInfo.DeviceInfo device;
  final List colors;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /// Get an instance of the stored user data
        UserData s = UserData.fromJSON(Map<String, dynamic>.from(
            Hive.box(userDataBoxName).get(userDataKeyName)));
        s.colors = colors;
        ModelsService().saveUserDataToHive(s);

        Get.snackbar(
          'success',
          'New Color was set successfully but you will need to restart the app in order for changes to be applied',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 4),
          isDismissible: true,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        );
      },
      child: Container(
        padding: EdgeInsets.all(device.screenWidth * .02),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: kInActiveTextColor,
          ),
          borderRadius: BorderRadius.circular(device.localWidth * .02),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Color(colors[1]),
              radius: device.screenWidth * .07,
            ),
            SizedBox(width: device.screenWidth * .014),
            CircleAvatar(
              backgroundColor: Color(colors[0]),
              radius: device.screenWidth * .07,
            ),
            SizedBox(width: device.screenWidth * .014),
            CircleAvatar(
              backgroundColor: Color(colors[4]),
              radius: device.screenWidth * .07,
            ),
            SizedBox(width: device.screenWidth * .014),
            CircleAvatar(
              backgroundColor: Color(colors[2]),
              radius: device.screenWidth * .07,
            ),
          ],
        ),
      ),
    );
  }
}
