import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:paypay/BackEnd/Models/models.dart';

import 'package:paypay/BackEnd/services/models_services.dart';
import 'package:paypay/FrontEnd/constants/constants.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/settings_page.dart';

import '../../BackEnd/controller/home_controller.dart';

// This Widget Is Used In All Screens
class Header extends StatelessWidget {
  final bool isHome;
  final String date;
  final String title;

  const Header({this.isHome = false, this.date, this.title});

  @override
  Widget build(BuildContext context) {
    UserData data = UserData.fromJSON(Map<String, dynamic>.from(
        Hive.box(userDataBoxName).get(userDataKeyName)));
    return DeviceData(
      builder: (context, device) => Container(
        margin: EdgeInsets.only(
            top: (device.screenHeight > 640)
                ? MediaQuery.of(context).padding.top +
                    (device.screenHeight * .05)
                : MediaQuery.of(context).padding.top +
                    (device.screenHeight * .01)),
        width: device.screenWidth * .55,
        height: device.screenHeight * .22,
        child: AspectRatio(
          aspectRatio: 215 / 147,
          child: LayoutBuilder(
            builder: (context, constraints) => Directionality(
              textDirection: Constants.appLanguageCode == "ar"
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Icons
                        Container(
                          width: constraints.maxWidth * .2,
                          child: isHome
                              ? InkWell(
                                  onTap: () =>
                                      Get.toNamed(SettingsScreen.routeName),
                                  child: SvgPicture.asset(
                                    "assets/icons/settings.svg", // The Settings Icon is gonna be shown in home screen only
                                    height: constraints.maxHeight * .2,
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Constants.appLanguageCode == "ar"
                                      ? RotationTransition(
                                          turns:
                                              AlwaysStoppedAnimation(180 / 360),
                                          child: SvgPicture.asset(
                                            "assets/icons/back_arrow.svg", // Back Arrow Icon
                                            height: constraints.maxHeight * .15,
                                          ),
                                        )
                                      : SvgPicture.asset(
                                          "assets/icons/back_arrow.svg", // Back Arrow Icon
                                          height: constraints.maxHeight * .15,
                                        ),
                                ),
                        ),
                        //User Profile Picture
                        Container(
                            width: device.localWidth * .25,
                            height: device.localWidth * .25,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                                "assets/images/owner.png") // This Should change Depending on the User
                            ),
                        //Currency
                        Container(
                          width: device.localWidth * .1,
                          height: device.localWidth * .1,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor,
                          ),
                          child: Center(
                            child: Text(
                              data.currency ??
                                  "", // This Should Change Depending in Settings of the User
                              style: TextStyle(
                                  fontSize: (device.localWidth * .1) * .43,
                                  fontWeight: FontWeight.w500,
                                  color: kLightTextColor),
                            ),
                          ),
                        )
                      ],
                    ),

                    Spacer(),
                    // Header Title
                    // RichText(
                    //   textAlign: TextAlign.center,
                    //   text: TextSpan(
                    //     children: [
                    AutoSizeText(
                      (isHome) ? data.name ?? "" : title.toUpperCase(),
                      maxLines: 1,
                      style: TextStyle(
                          height: .3,
                          fontWeight: FontWeight.w700,
                          color: kDarkTextColor,
                          fontFamily: Constants.appLanguageCode == "ar"
                              ? "GE_SS"
                              : "Poppins",
                          fontSize: device.localWidth * .1),
                    ),
                    (date != null)
                        ? AutoSizeText(
                            "${translate("lastUpdate")} ${(date == "") ? "" : data.signUpDate ?? "no date"} ",
                            style: TextStyle(
                                // height: .3,
                                color: kDarkTextColor,
                                fontFamily: Constants.appLanguageCode == "ar"
                                    ? "GE_SS"
                                    : "Poppins",
                                fontSize: device.localWidth * .037),
                          )
                        : AutoSizeText("sasa",
                            style: TextStyle(
                                // height: .3,
                                color: Colors.white,
                                fontFamily: Constants.appLanguageCode == "ar"
                                    ? "GE_SS"
                                    : "Poppins",
                                fontSize: device.localWidth * .037)),
                  ],
                  // ),
                  // ),
                  // ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
