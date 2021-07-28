import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:paypay/FrontEnd/constants/constants.dart';

import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/about_page.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/change_colors.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/guides_screen.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/lang_screen.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/profile.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/reset_page.dart';

import 'package:paypay/FrontEnd/screens/SettingsScreen/team_page.dart';

import 'package:paypay/FrontEnd/widgets/header.dart';
import 'package:paypay/FrontEnd/widgets/setting_tile.dart';

import '../../widgets/new_page.dart';

class SettingsScreen extends StatelessWidget {
  // This is the Route Name that We Are going to use whenever we need to navigate to this page
  static String routeName = '/SettingsScreen';

  @override
  Widget build(BuildContext context) {
    return NewPage(
      children: [
        Header(
          title: translate("settings"),
          date: null,
        ),
        Expanded(
          flex: 12,
          child: DeviceData(builder: (_, device) {
            double height = device.localWidth * .07;
            return Container(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Setting(
                    icon: Icon(Icons.person_outlined,
                        color: kPrimaryColor, size: height),
                    title: translate("profile"),
                    onTap: () => Get.toNamed(Profile.routeName),
                  ),
                  Setting(
                    icon: Icon(Icons.info_outline,
                        color: kPrimaryColor, size: height),
                    title: translate("aboutTheApp"),
                    onTap: () => Get.toNamed(AboutScreen.routeName),
                  ),
                  Setting(
                    icon: Icon(Icons.code_rounded,
                        color: kPrimaryColor, size: height),
                    title: translate("ourTeam"),
                    onTap: () => Get.toNamed(TeamScreen.routeName),
                  ),
                  Setting(
                    icon: Icon(Icons.invert_colors_outlined,
                        color: kPrimaryColor, size: height),
                    title: translate("change_color_theme"),
                    onTap: () async {
                      Get.toNamed(ChangeColorScreen.routeName);
                    },
                  ),
                  Setting(
                    icon: Icon(Icons.integration_instructions_outlined,
                        color: kPrimaryColor, size: height),
                    title: translate("guides"),
                    onTap: () async {
                      Get.toNamed(GuidesScreen.routeName);
                    },
                  ),
                  // Setting(
                  //   icon: Icon(Icons.share_outlined,
                  //       color: kPrimaryColor, size:height),
                  //   title: translate("share_paypay"),
                  //   onTap: () => null,
                  // ),
                  Setting(
                    icon: Icon(Icons.language_outlined,
                        color: kPrimaryColor, size: height),
                    title: translate("change_language"),
                    onTap: () => Get.toNamed(LanguageScreen.routeName),
                  ),
                  Setting(
                    icon: Icon(Icons.delete_outline,
                        color: kPrimaryColor, size: height),
                    title: translate("resetData"),
                    onTap: () => Get.toNamed(ResetPage.routeName),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
