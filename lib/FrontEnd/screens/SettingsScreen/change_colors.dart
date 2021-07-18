import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
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
          title: translate("theme"),
          date: null,
        ),
        AutoSizeText(
          "PayPay ${translate("change_color_theme_description")} 😎🙌",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
            fontSize: 13,
            height: 1.4,
            color: Colors.blueGrey,
            fontWeight: FontWeight.normal,
          ),
          maxLines: 10,
        ),
        SizedBox(height: device.screenHeight * .02),
        Wrap(
          direction: Axis.horizontal,
          children: [
            ColorThemeOption(device: device, colors: colors1),
            ColorThemeOption(device: device, colors: colors2),
            ColorThemeOption(device: device, colors: colors3),
            ColorThemeOption(device: device, colors: colors4),
            ColorThemeOption(device: device, colors: colors5),
            ColorThemeOption(device: device, colors: colors6),
          ],
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
      splashColor: kPrimaryLightColor,
      borderRadius: BorderRadius.circular(device.localWidth * .03),
      onTap: () {
        /// Get an instance of the stored user data
        UserData s = UserData.fromJSON(Map<String, dynamic>.from(
            Hive.box(userDataBoxName).get(userDataKeyName)));
        s.colors = colors;
        ModelsService().saveUserDataToHive(s);

        Get.snackbar(
          translate("success"),
          translate("success_description"),
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 4),
          isDismissible: true,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        );
      },
      child: Container(
        // width: device.screenWidth * .7,
        padding: EdgeInsets.all(kDefaultPadding - 10),
        margin: EdgeInsets.all(kDefaultPadding - 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(device.localWidth * .03),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 26,
              color: Colors.black.withOpacity(.04),
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Wrap(
          direction: Axis.horizontal,
          children: [
            CircleAvatar(
              backgroundColor: Color(colors[1]),
              radius: device.screenWidth * .05,
            ),
            SizedBox(width: device.screenWidth * .014),
            CircleAvatar(
              backgroundColor: Color(colors[0]),
              radius: device.screenWidth * .05,
            ),
            // SizedBox(width: device.screenWidth * .014),
            // CircleAvatar(
            //   backgroundColor: Color(colors[4]),
            //   radius: device.screenWidth * .07,
            // ),
            // SizedBox(width: device.screenWidth * .014),
            // CircleAvatar(
            //   backgroundColor: Color(colors[2]),
            //   radius: device.screenWidth * .07,
            // ),
          ],
        ),
      ),
    );
  }
}
